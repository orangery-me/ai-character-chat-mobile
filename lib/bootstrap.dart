import 'dart:async';

import 'package:ai_character_chat_mobile/app/app_bloc_observer.dart';
import 'package:ai_character_chat_mobile/config/app_config.dart';
import 'package:ai_character_chat_mobile/di/di.dart';
import 'package:ai_character_chat_mobile/flavors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

typedef BootstrapBuilder = FutureOr<Widget> Function();

Future<void> bootstrap(BootstrapBuilder builder, Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  final AppConfig appConfig = AppConfig.fromEnvironment(
    expectedEnvironment: flavor.environment,
  );

  await initializeApp(appConfig: appConfig);

  runApp(await builder());
}

Future<void> initializeApp({required AppConfig appConfig}) async {
  await Hive.initFlutter();

  await Future.wait([
    EasyLocalization.ensureInitialized(),
    configureDependencies(appConfig: appConfig),
  ]);
  EasyLocalization.logger.enableBuildModes = [];

  Bloc.observer = AppBlocObserver();
}
