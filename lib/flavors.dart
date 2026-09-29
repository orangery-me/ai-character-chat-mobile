import 'package:ai_character_chat_mobile/config/app_config.dart';

enum Flavor {
  DEV(MobileAppEnvironment.development, 'AI Character Chat DEV'),
  STAGING(MobileAppEnvironment.staging, 'AI Character Chat STAGING'),
  PROD(MobileAppEnvironment.production, 'AI Character Chat');

  const Flavor(this.environment, this.title);

  final MobileAppEnvironment environment;
  final String title;
}
