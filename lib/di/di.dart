import 'package:ai_character_chat_mobile/common/constants/hive_keys.dart';
import 'package:ai_character_chat_mobile/common/helpers/dio_helper.dart';
import 'package:ai_character_chat_mobile/config/app_config.dart';
import 'package:ai_character_chat_mobile/data/datasources/auth/auth_token_storage.dart';
import 'package:ai_character_chat_mobile/data/datasources/user/local/user_datasource.dart';
import 'package:ai_character_chat_mobile/data/repositories/session_repository.dart';
import 'package:ai_character_chat_mobile/data/repositories/user_repository.dart';
import 'package:ai_character_chat_mobile/di/providers/dio_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies({required AppConfig appConfig}) async {
  await getIt.reset();
  final authBox = await Hive.openBox<dynamic>(HiveKeys.authBox);
  const secureStorage = FlutterSecureStorage();
  final tokenStorage = AuthTokenStorage(storage: secureStorage);
  final authDio = DioProvider.createBaseDio(appConfig);
  final sessions = SessionRepository(
    authDio: authDio,
    tokenStorage: tokenStorage,
  );
  final dioProvider = DioProvider(appConfig: appConfig, sessions: sessions);
  final localUsers = UserLocalDataSource(authBox: authBox);

  getIt.registerSingleton<AppConfig>(appConfig);
  getIt.registerSingleton<AuthTokenStorage>(tokenStorage);
  getIt.registerSingleton<SessionRepository>(sessions);
  getIt.registerSingleton<DioProvider>(dioProvider);
  getIt.registerSingleton<DioHelper>(DioHelper(dio: dioProvider.getDio()));
  getIt.registerSingleton<UserLocalDataSource>(localUsers);
  getIt.registerSingleton<UserRepository>(
    UserRepository(sessionRepository: sessions, localDataSource: localUsers),
  );
}
