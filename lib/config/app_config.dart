import 'package:ai_character_chat_mobile/common/constants/env_keys.dart';

enum MobileAppEnvironment { development, staging, production }

class AppConfig {
  const AppConfig._({
    required this.environment,
    required this.baseUrl,
    required this.connectTimeoutMs,
    required this.sendTimeoutMs,
    required this.receiveTimeoutMs,
    required this.allowClearTextHttp,
    required this.supabaseUrl,
    required this.supabasePublishableKey,
  });

  final MobileAppEnvironment environment;
  final String baseUrl;
  final int connectTimeoutMs;
  final int sendTimeoutMs;
  final int receiveTimeoutMs;
  final bool allowClearTextHttp;
  final String supabaseUrl;
  final String supabasePublishableKey;

  factory AppConfig.fromDefineStrings({
    required String appEnvironment,
    required String baseUrl,
    required String connectTimeoutMs,
    required String sendTimeoutMs,
    required String receiveTimeoutMs,
    required String allowClearTextHttp,
    required String supabaseUrl,
    required String supabasePublishableKey,
    required MobileAppEnvironment expectedEnvironment,
  }) {
    final MobileAppEnvironment? parsedEnvironment = switch (appEnvironment) {
      'development' => MobileAppEnvironment.development,
      'staging' => MobileAppEnvironment.staging,
      'production' => MobileAppEnvironment.production,
      _ => null,
    };

    if (parsedEnvironment == null || parsedEnvironment != expectedEnvironment) {
      throw FormatException('APP_ENV must match the selected mobile flavor.');
    }

    final Uri? parsedBaseUrl = Uri.tryParse(baseUrl);
    if (parsedBaseUrl == null ||
        !parsedBaseUrl.hasAuthority ||
        parsedBaseUrl.host.isEmpty ||
        parsedBaseUrl.userInfo.isNotEmpty ||
        (parsedBaseUrl.path.isNotEmpty && parsedBaseUrl.path != '/') ||
        parsedBaseUrl.hasQuery ||
        parsedBaseUrl.hasFragment) {
      throw FormatException(
        'BASE_URL must be an origin without path, credentials, query, or fragment.',
      );
    }

    final bool isClearTextHttp = parsedBaseUrl.scheme == 'http';
    if (parsedBaseUrl.scheme != 'https' &&
        !(isClearTextHttp &&
            expectedEnvironment == MobileAppEnvironment.development &&
            allowClearTextHttp == 'true')) {
      throw FormatException(
        'BASE_URL must use HTTPS outside explicitly allowed development HTTP.',
      );
    }

    if (allowClearTextHttp != 'true' && allowClearTextHttp != 'false') {
      throw FormatException('ALLOW_CLEAR_TEXT_HTTP must be true or false.');
    }

    if (allowClearTextHttp == 'true' &&
        expectedEnvironment != MobileAppEnvironment.development) {
      throw FormatException(
        'ALLOW_CLEAR_TEXT_HTTP can be true only for development.',
      );
    }

    final Uri validatedOrigin = Uri(
      scheme: parsedBaseUrl.scheme,
      host: parsedBaseUrl.host,
      port: parsedBaseUrl.hasPort ? parsedBaseUrl.port : null,
    );
    final Uri? parsedSupabaseUrl = Uri.tryParse(supabaseUrl);
    if (parsedSupabaseUrl == null ||
        parsedSupabaseUrl.scheme != 'https' ||
        parsedSupabaseUrl.host.isEmpty ||
        parsedSupabaseUrl.path.isNotEmpty ||
        parsedSupabaseUrl.hasQuery ||
        parsedSupabaseUrl.hasFragment) {
      throw FormatException('SUPABASE_URL must be an HTTPS origin.');
    }
    if (!supabasePublishableKey.startsWith('sb_publishable_')) {
      throw FormatException(
        'SUPABASE_PUBLISHABLE_KEY must be a Supabase publishable key.',
      );
    }

    return AppConfig._(
      environment: parsedEnvironment,
      baseUrl: validatedOrigin.toString(),
      connectTimeoutMs: _parseTimeout(connectTimeoutMs, 'CONNECT_TIMEOUT_MS'),
      sendTimeoutMs: _parseTimeout(sendTimeoutMs, 'SEND_TIMEOUT_MS'),
      receiveTimeoutMs: _parseTimeout(receiveTimeoutMs, 'RECEIVE_TIMEOUT_MS'),
      allowClearTextHttp: allowClearTextHttp == 'true',
      supabaseUrl: parsedSupabaseUrl.toString(),
      supabasePublishableKey: supabasePublishableKey,
    );
  }

  factory AppConfig.fromEnvironment({
    required MobileAppEnvironment expectedEnvironment,
  }) {
    return AppConfig.fromDefineStrings(
      appEnvironment: const String.fromEnvironment(EnvKeys.appEnvironment),
      baseUrl: const String.fromEnvironment(EnvKeys.baseUrl),
      connectTimeoutMs: const String.fromEnvironment(EnvKeys.connectTimeoutMs),
      sendTimeoutMs: const String.fromEnvironment(EnvKeys.sendTimeoutMs),
      receiveTimeoutMs: const String.fromEnvironment(EnvKeys.receiveTimeoutMs),
      allowClearTextHttp: const String.fromEnvironment(
        EnvKeys.allowClearTextHttp,
      ),
      supabaseUrl: const String.fromEnvironment(EnvKeys.supabaseUrl),
      supabasePublishableKey: const String.fromEnvironment(
        EnvKeys.supabasePublishableKey,
      ),
      expectedEnvironment: expectedEnvironment,
    );
  }

  static int _parseTimeout(String value, String fieldName) {
    final int? timeoutMs = int.tryParse(value);
    if (timeoutMs == null || timeoutMs < 1000 || timeoutMs > 60000) {
      throw FormatException(
        '$fieldName must be an integer from 1000 through 60000.',
      );
    }

    return timeoutMs;
  }
}
