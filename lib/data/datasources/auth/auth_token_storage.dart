import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract interface class RefreshTokenStore {
  Future<String?> readRefreshToken();
  Future<void> writeRefreshToken(String refreshToken);
  Future<void> clear();
}

class AuthTokenStorage implements RefreshTokenStore {
  AuthTokenStorage({required FlutterSecureStorage storage})
    : _storage = storage;

  static const String _refreshTokenKey = 'auth.refresh_token';
  final FlutterSecureStorage _storage;

  @override
  Future<String?> readRefreshToken() => _storage.read(key: _refreshTokenKey);

  @override
  Future<void> writeRefreshToken(String refreshToken) {
    return _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  @override
  Future<void> clear() => _storage.delete(key: _refreshTokenKey);
}
