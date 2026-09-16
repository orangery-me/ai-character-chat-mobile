import 'package:ai_character_chat_mobile/common/constants/hive_keys.dart';
import 'package:ai_character_chat_mobile/common/helpers/dio_helper.dart';
import 'package:ai_character_chat_mobile/data/datasources/chat/chat_datasource.dart';
import 'package:ai_character_chat_mobile/data/datasources/user/local/user_datasource.dart';
import 'package:ai_character_chat_mobile/data/datasources/user/remote/user_datasource.dart';
import 'package:ai_character_chat_mobile/data/datasources/user/user_datasource.dart';
import 'package:ai_character_chat_mobile/data/repositories/user_repository.dart';
import 'package:ai_character_chat_mobile/di/modules/local_module.dart';
import 'package:ai_character_chat_mobile/di/modules/network_module.dart';
import 'package:ai_character_chat_mobile/di/providers/dio_provider.dart';
import 'package:ai_character_chat_mobile/presentation/home/bloc/chat/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

Future<GetIt> initGetIt(
  GetIt getIt, {
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
  final gh = GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final localModule = LocalModuleImpl();
  final networkModule = NetworkModuleImpl();

  gh.lazySingleton<GlobalKey<NavigatorState>>(
    () => localModule.navigatorKey,
  );
  await gh.singletonAsync<Box<dynamic>>(
    () => localModule.authBox,
    instanceName: HiveKeys.authBox,
    preResolve: true,
  );
  gh.lazySingleton<UserLocalDataSource>(
    () => UserLocalDataSource(
      authBox: gh<Box<dynamic>>(instanceName: HiveKeys.authBox),
    ),
  );
  gh.lazySingleton<DioProvider>(
    () => DioProvider(
      gh<Box<dynamic>>(instanceName: HiveKeys.authBox),
      gh<GlobalKey<NavigatorState>>(),
    ),
  );
  gh.lazySingleton<DioHelper>(
    () => networkModule.provideDioHelper(gh<DioProvider>()),
  );
  gh.lazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSource(dioHelper: gh<DioHelper>()),
  );
  gh.lazySingleton<UserDataSource>(
    () => UserDataSource(
      remoteDataSource: gh<UserRemoteDataSource>(),
      localDataSource: gh<UserLocalDataSource>(),
    ),
  );
  gh.lazySingleton<UserRepository>(
    () => UserRepository(dataSource: gh<UserDataSource>()),
  );
  gh.lazySingleton<ChatDatasource>(
    () => ChatDatasource(dioHelper: gh<DioHelper>()),
  );
  gh.factory<ChatBloc>(
    () => ChatBloc(chatDatasource: gh<ChatDatasource>()),
  );

  return getIt;
}

class LocalModuleImpl extends LocalModule {}

class NetworkModuleImpl extends NetworkModule {}
