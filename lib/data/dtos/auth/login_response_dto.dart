import 'package:ai_character_chat_mobile/data/models/user_model.dart';

class LoginResponseDTO {
  const LoginResponseDTO({
    required this.accessToken,
    required this.accessTokenExpiresInSeconds,
    required this.refreshToken,
    required this.refreshTokenExpiresAt,
    required this.sessionId,
    required this.user,
  });

  factory LoginResponseDTO.fromJson(Map<String, dynamic> json) {
    final accessToken = json['accessToken'];
    final accessExpires = json['accessTokenExpiresInSeconds'];
    final refreshToken = json['refreshToken'];
    final refreshExpires = json['refreshTokenExpiresAt'];
    final sessionId = json['sessionId'];
    final user = json['user'];
    if (accessToken is! String ||
        accessExpires is! int ||
        refreshToken is! String ||
        refreshExpires is! String ||
        sessionId is! String ||
        user is! Map<String, dynamic>) {
      throw const FormatException(
        'Authentication response has an invalid shape.',
      );
    }
    final parsedExpiry = DateTime.tryParse(refreshExpires);
    if (parsedExpiry == null) {
      throw const FormatException(
        'refreshTokenExpiresAt must be an RFC 3339 timestamp.',
      );
    }
    return LoginResponseDTO(
      accessToken: accessToken,
      accessTokenExpiresInSeconds: accessExpires,
      refreshToken: refreshToken,
      refreshTokenExpiresAt: parsedExpiry,
      sessionId: sessionId,
      user: UserModel.fromJson(user),
    );
  }

  final String accessToken;
  final int accessTokenExpiresInSeconds;
  final String refreshToken;
  final DateTime refreshTokenExpiresAt;
  final String sessionId;
  final UserModel user;
}
