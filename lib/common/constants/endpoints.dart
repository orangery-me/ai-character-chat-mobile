abstract class Endpoints {
  static const String apiUrl = '/api/v1';

  // auth api
  static const String login = '$apiUrl/auth/login';
  static const String logout = '$apiUrl/auth/logout';
  static const String refresh = '$apiUrl/auth/refresh';

  // user api
  static const String getUser = '$apiUrl/users/me';
}
