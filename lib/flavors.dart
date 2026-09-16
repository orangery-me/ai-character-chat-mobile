import 'package:ai_character_chat_mobile/common/constants/env_keys.dart';

enum Flavor {
  DEV,
  STAGING,
  PROD,
}

class AppFlavor {
  static Flavor? appFlavor;

  static String get apiBaseUrl => const String.fromEnvironment(EnvKeys.baseURL);

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'AI Character Chat DEV';
      case Flavor.STAGING:
        return 'AI Character Chat STAGING';
      case Flavor.PROD:
        return 'AI Character Chat';
      default:
        return 'AI Character Chat DEV';
    }
  }

}
