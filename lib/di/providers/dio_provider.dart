import 'dart:io';

import 'package:ai_character_chat_mobile/config/app_config.dart';
import 'package:ai_character_chat_mobile/data/repositories/session_repository.dart';
import 'package:ai_character_chat_mobile/di/interceptors/app_interceptor.dart';
import 'package:dio/dio.dart';

class DioProvider {
  DioProvider({
    required AppConfig appConfig,
    required SessionRepository sessions,
  }) : _appConfig = appConfig,
       _sessions = sessions;

  final AppConfig _appConfig;
  final SessionRepository _sessions;
  Dio? _dio;

  Dio getDio() {
    final cached = _dio;
    if (cached != null) return cached;

    final dio = createBaseDio(_appConfig);
    dio.interceptors.add(AppInterceptor(sessions: _sessions, dio: dio));
    _dio = dio;
    return dio;
  }

  static Dio createBaseDio(AppConfig config) {
    return Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        connectTimeout: Duration(milliseconds: config.connectTimeoutMs),
        receiveTimeout: Duration(milliseconds: config.receiveTimeoutMs),
        sendTimeout: Duration(milliseconds: config.sendTimeoutMs),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: ContentType.json.value,
        },
      ),
    );
  }
}
