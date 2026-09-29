import 'package:ai_character_chat_mobile/config/app_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppConfig.fromDefineStrings', () {
    test(
      'accepts an explicit development origin and timeout configuration',
      () {
        final config = AppConfig.fromDefineStrings(
          appEnvironment: 'development',
          baseUrl: 'http://10.0.2.2:8105',
          connectTimeoutMs: '30000',
          sendTimeoutMs: '30000',
          receiveTimeoutMs: '30000',
          allowClearTextHttp: 'true',
          supabaseUrl: 'https://example-project.supabase.co',
          supabasePublishableKey: 'sb_publishable_local_test_key',
          expectedEnvironment: MobileAppEnvironment.development,
        );

        expect(config.baseUrl, 'http://10.0.2.2:8105');
        expect(config.connectTimeoutMs, 30000);
        expect(config.allowClearTextHttp, isTrue);
      },
    );

    test('rejects a missing required timeout value by key', () {
      expect(
        () => AppConfig.fromDefineStrings(
          appEnvironment: 'development',
          baseUrl: 'http://localhost:8105',
          connectTimeoutMs: '',
          sendTimeoutMs: '30000',
          receiveTimeoutMs: '30000',
          allowClearTextHttp: 'true',
          supabaseUrl: 'https://example-project.supabase.co',
          supabasePublishableKey: 'sb_publishable_local_test_key',
          expectedEnvironment: MobileAppEnvironment.development,
        ),
        throwsA(
          isA<FormatException>().having(
            (error) => error.message,
            'message',
            contains('CONNECT_TIMEOUT_MS'),
          ),
        ),
      );
    });

    test('rejects non-origin URLs and mismatched flavor configuration', () {
      expect(
        () => AppConfig.fromDefineStrings(
          appEnvironment: 'staging',
          baseUrl: 'https://api.example.invalid/api',
          connectTimeoutMs: '30000',
          sendTimeoutMs: '30000',
          receiveTimeoutMs: '30000',
          allowClearTextHttp: 'false',
          supabaseUrl: 'https://example-project.supabase.co',
          supabasePublishableKey: 'sb_publishable_local_test_key',
          expectedEnvironment: MobileAppEnvironment.staging,
        ),
        throwsFormatException,
      );

      expect(
        () => AppConfig.fromDefineStrings(
          appEnvironment: 'production',
          baseUrl: 'https://api.example.invalid',
          connectTimeoutMs: '30000',
          sendTimeoutMs: '30000',
          receiveTimeoutMs: '30000',
          allowClearTextHttp: 'false',
          supabaseUrl: 'https://example-project.supabase.co',
          supabasePublishableKey: 'sb_publishable_local_test_key',
          expectedEnvironment: MobileAppEnvironment.staging,
        ),
        throwsFormatException,
      );
    });

    test('rejects timeout values outside the documented range', () {
      expect(
        () => AppConfig.fromDefineStrings(
          appEnvironment: 'production',
          baseUrl: 'https://api.example.invalid',
          connectTimeoutMs: '999',
          sendTimeoutMs: '30000',
          receiveTimeoutMs: '30000',
          allowClearTextHttp: 'false',
          supabaseUrl: 'https://example-project.supabase.co',
          supabasePublishableKey: 'sb_publishable_local_test_key',
          expectedEnvironment: MobileAppEnvironment.production,
        ),
        throwsFormatException,
      );
    });
  });
}
