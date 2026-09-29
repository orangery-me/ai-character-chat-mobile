import 'dart:async';
import 'dart:math';

import 'package:ai_character_chat_mobile/common/constants/endpoints.dart';
import 'package:ai_character_chat_mobile/data/datasources/auth/auth_token_storage.dart';
import 'package:ai_character_chat_mobile/data/dtos/api/api_envelope.dart';
import 'package:ai_character_chat_mobile/data/dtos/api/api_problem.dart';
import 'package:ai_character_chat_mobile/data/dtos/auth/login_by_email_request_dto.dart';
import 'package:ai_character_chat_mobile/data/dtos/auth/login_response_dto.dart';
import 'package:ai_character_chat_mobile/data/models/user_model.dart';
import 'package:dio/dio.dart';

enum SessionStatus { unauthenticated, authenticated, sessionExpired }

class SessionRepository {
  SessionRepository({
    required Dio authDio,
    required RefreshTokenStore tokenStorage,
  }) : _authDio = authDio,
       _tokenStorage = tokenStorage;

  final Dio _authDio;
  final RefreshTokenStore _tokenStorage;
  final StreamController<SessionStatus> _statusController =
      StreamController<SessionStatus>.broadcast();
  Future<String>? _refreshFuture;
  String? _accessToken;
  UserModel? _currentUser;

  Stream<SessionStatus> get statusChanges => _statusController.stream;
  String? get accessToken => _accessToken;
  UserModel? get currentUser => _currentUser;

  Future<UserModel?> hydrate() async {
    final refreshToken = await _tokenStorage.readRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) {
      _statusController.add(SessionStatus.unauthenticated);
      return null;
    }

    await refreshAccessToken();
    return _currentUser;
  }

  Future<UserModel> login(LoginByEmailRequestDTO input) async {
    try {
      final response = await _authDio.post<dynamic>(
        Endpoints.login,
        data: input.toJson(),
      );
      final tokens = ApiEnvelope<LoginResponseDTO>.fromJson(
        response.data,
        LoginResponseDTO.fromJson,
      ).data;
      await _acceptTokens(tokens);
      return tokens.user;
    } on DioException catch (error) {
      throw _mapDioError(error);
    }
  }

  Future<String> refreshAccessToken() async {
    final activeRefresh = _refreshFuture;
    if (activeRefresh != null) return activeRefresh;

    final refresh = _performRefresh();
    _refreshFuture = refresh;
    try {
      return await refresh;
    } finally {
      if (identical(_refreshFuture, refresh)) _refreshFuture = null;
    }
  }

  Future<void> logout() async {
    final token = _accessToken;
    if (token != null) {
      try {
        await _authDio.post<void>(
          Endpoints.logout,
          options: Options(
            headers: <String, String>{'authorization': 'Bearer $token'},
          ),
        );
      } on DioException catch (error) {
        final status = error.response?.statusCode;
        if (status != 401 && status != 403) throw _mapDioError(error);
      }
    }
    await _clear(SessionStatus.unauthenticated);
  }

  Future<String> _performRefresh() async {
    final refreshToken = await _tokenStorage.readRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) {
      await _clear(SessionStatus.sessionExpired);
      throw const SessionExpiredException();
    }

    final refreshRequestId = _uuidV4();
    DioException? lastTransportError;
    for (var attempt = 0; attempt < 2; attempt += 1) {
      try {
        final response = await _authDio.post<dynamic>(
          Endpoints.refresh,
          data: <String, String>{
            'refreshToken': refreshToken,
            'refreshRequestId': refreshRequestId,
          },
        );
        final tokens = ApiEnvelope<LoginResponseDTO>.fromJson(
          response.data,
          LoginResponseDTO.fromJson,
        ).data;
        await _acceptTokens(tokens);
        return tokens.accessToken;
      } on DioException catch (error) {
        final status = error.response?.statusCode;
        if (status == 401 || status == 403) {
          await _clear(SessionStatus.sessionExpired);
          throw const SessionExpiredException();
        }
        if (status == null || status >= 500) {
          lastTransportError = error;
          continue;
        }
        throw _mapDioError(error);
      }
    }
    throw lastTransportError!;
  }

  Future<void> _acceptTokens(LoginResponseDTO tokens) async {
    await _tokenStorage.writeRefreshToken(tokens.refreshToken);
    _accessToken = tokens.accessToken;
    _currentUser = tokens.user;
    _statusController.add(SessionStatus.authenticated);
  }

  Future<void> _clear(SessionStatus status) async {
    _accessToken = null;
    _currentUser = null;
    await _tokenStorage.clear();
    _statusController.add(status);
  }

  Object _mapDioError(DioException error) {
    if (error.response?.data != null) {
      try {
        return ApiProblemException(ApiProblem.fromJson(error.response!.data));
      } on FormatException {
        return const FormatException(
          'Server returned a malformed problem response.',
        );
      }
    }
    return error;
  }

  String _uuidV4() {
    final random = Random.secure();
    final bytes = List<int>.generate(16, (_) => random.nextInt(256));
    bytes[6] = (bytes[6] & 0x0f) | 0x40;
    bytes[8] = (bytes[8] & 0x3f) | 0x80;
    final hex = bytes
        .map((value) => value.toRadixString(16).padLeft(2, '0'))
        .join();
    return '${hex.substring(0, 8)}-${hex.substring(8, 12)}-${hex.substring(12, 16)}-'
        '${hex.substring(16, 20)}-${hex.substring(20)}';
  }
}
