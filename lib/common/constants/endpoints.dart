import 'package:ai_character_chat_mobile/flavors.dart';

abstract class Endpoints {
  static String apiUrl = '${AppFlavor.apiBaseUrl}/v1';

  // auth api
  static String login = '$apiUrl/oauth/token';
  static String logout = '$apiUrl/oauth/revoke';

  // user api
  static String getUser = '$apiUrl/user';
}
