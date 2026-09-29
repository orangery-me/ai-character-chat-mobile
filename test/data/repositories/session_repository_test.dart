import 'package:ai_character_chat_mobile/common/constants/endpoints.dart';
import 'package:ai_character_chat_mobile/data/datasources/auth/auth_token_storage.dart';
import 'package:ai_character_chat_mobile/data/dtos/api/api_problem.dart';
import 'package:ai_character_chat_mobile/data/repositories/session_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'concurrent refresh calls use one request and persist rotated token',
    () async {
      final store = _MemoryTokenStore('refresh-old');
      final interceptor = _RefreshInterceptor(<_Reply>[
        _Reply.success(_tokenEnvelope('refresh-new')),
      ]);
      final repository = SessionRepository(
        authDio: Dio()..interceptors.add(interceptor),
        tokenStorage: store,
      );

      final results = await Future.wait(<Future<String>>[
        repository.refreshAccessToken(),
        repository.refreshAccessToken(),
      ]);

      expect(results, <String>['access-token', 'access-token']);
      expect(interceptor.requestIds, hasLength(1));
      expect(store.value, 'refresh-new');
    },
  );

  test('transient refresh retry keeps token and reuses request id', () async {
    final store = _MemoryTokenStore('refresh-old');
    final interceptor = _RefreshInterceptor(<_Reply>[
      const _Reply.failure(503),
      _Reply.success(_tokenEnvelope('refresh-new')),
    ]);
    final repository = SessionRepository(
      authDio: Dio()..interceptors.add(interceptor),
      tokenStorage: store,
    );

    await repository.refreshAccessToken();

    expect(interceptor.requestIds, hasLength(2));
    expect(interceptor.requestIds.toSet(), hasLength(1));
    expect(store.value, 'refresh-new');
  });

  test(
    'definitive refresh rejection clears token and expires session',
    () async {
      final store = _MemoryTokenStore('refresh-old');
      final interceptor = _RefreshInterceptor(<_Reply>[
        const _Reply.failure(401),
      ]);
      final repository = SessionRepository(
        authDio: Dio()..interceptors.add(interceptor),
        tokenStorage: store,
      );
      final status = expectLater(
        repository.statusChanges,
        emits(SessionStatus.sessionExpired),
      );

      await expectLater(
        repository.refreshAccessToken(),
        throwsA(isA<SessionExpiredException>()),
      );
      await status;
      expect(store.value, isNull);
    },
  );
}

class _MemoryTokenStore implements RefreshTokenStore {
  _MemoryTokenStore(this.value);

  String? value;

  @override
  Future<void> clear() async => value = null;

  @override
  Future<String?> readRefreshToken() async => value;

  @override
  Future<void> writeRefreshToken(String refreshToken) async {
    value = refreshToken;
  }
}

class _RefreshInterceptor extends Interceptor {
  _RefreshInterceptor(this.replies);

  final List<_Reply> replies;
  final List<String> requestIds = <String>[];
  int _index = 0;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    expect(options.path, Endpoints.refresh);
    final body = options.data as Map<String, String>;
    requestIds.add(body['refreshRequestId']!);
    final reply = replies[_index];
    _index += 1;
    await Future<void>.delayed(const Duration(milliseconds: 10));
    if (reply.statusCode == 200) {
      handler.resolve(
        Response<dynamic>(
          requestOptions: options,
          statusCode: 200,
          data: reply.body,
        ),
      );
      return;
    }
    handler.reject(
      DioException(
        requestOptions: options,
        response: Response<dynamic>(
          requestOptions: options,
          statusCode: reply.statusCode,
          data: <String, dynamic>{
            'status': reply.statusCode,
            'code': 'refresh_rejected',
            'detail': 'Refresh rejected.',
            'requestId': 'request-id',
          },
        ),
      ),
    );
  }
}

class _Reply {
  const _Reply.failure(this.statusCode) : body = null;
  const _Reply.success(this.body) : statusCode = 200;

  final int statusCode;
  final Map<String, dynamic>? body;
}

Map<String, dynamic> _tokenEnvelope(String refreshToken) {
  return <String, dynamic>{
    'requestId': 'request-id',
    'data': <String, dynamic>{
      'accessToken': 'access-token',
      'accessTokenExpiresInSeconds': 900,
      'refreshToken': refreshToken,
      'refreshTokenExpiresAt': '2026-10-29T00:00:00.000Z',
      'sessionId': '018f3a2e-0000-7000-8000-000000000001',
      'user': <String, dynamic>{
        'id': '018f3a2e-0000-7000-8000-000000000002',
        'email': 'member@example.com',
        'displayName': 'Member',
        'bio': null,
        'dateOfBirth': null,
        'role': 'member',
        'status': 'active',
        'version': 1,
        'createdAt': '2026-09-29T00:00:00.000Z',
        'updatedAt': '2026-09-29T00:00:00.000Z',
      },
    },
  };
}
