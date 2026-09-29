import 'dart:io';

import 'package:ai_character_chat_mobile/common/constants/endpoints.dart';
import 'package:ai_character_chat_mobile/data/repositories/session_repository.dart';
import 'package:dio/dio.dart';

class AppInterceptor extends QueuedInterceptor {
  AppInterceptor({required SessionRepository sessions, required Dio dio})
    : _sessions = sessions,
      _dio = dio;

  static const String _retriedKey = 'authRetryCompleted';
  final SessionRepository _sessions;
  final Dio _dio;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = _sessions.accessToken;
    if (accessToken != null && !_isPublicAuthPath(options.path)) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final request = err.requestOptions;
    final alreadyRetried = request.extra[_retriedKey] == true;
    if (err.response?.statusCode != 401 ||
        alreadyRetried ||
        _isPublicAuthPath(request.path)) {
      handler.next(err);
      return;
    }

    try {
      final accessToken = await _sessions.refreshAccessToken();
      request.extra[_retriedKey] = true;
      request.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
      handler.resolve(await _dio.fetch<dynamic>(request));
    } on Object catch (refreshError) {
      handler.reject(
        DioException(
          requestOptions: request,
          error: refreshError,
          type: DioExceptionType.unknown,
        ),
      );
    }
  }

  bool _isPublicAuthPath(String path) {
    return path == Endpoints.login ||
        path == Endpoints.refresh ||
        path.startsWith('${Endpoints.apiUrl}/auth/register');
  }
}
