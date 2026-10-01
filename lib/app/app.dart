import 'package:ai_character_chat_mobile/common/constants/locales.dart';
import 'package:ai_character_chat_mobile/common/theme/app_theme.dart';
import 'package:ai_character_chat_mobile/data/repositories/user_repository.dart';
import 'package:ai_character_chat_mobile/di/di.dart';
import 'package:ai_character_chat_mobile/flavors.dart';
import 'package:ai_character_chat_mobile/generated/codegen_loader.g.dart';
import 'package:ai_character_chat_mobile/presentation/auth/bloc/auth/auth_bloc.dart';
import 'package:ai_character_chat_mobile/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class App extends StatefulWidget {
  const App({required this.flavor, super.key});

  final Flavor flavor;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AuthBloc _authBloc;
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc(userRepository: getIt<UserRepository>());
    _router = AppRouter.create(authBloc: _authBloc, flavor: widget.flavor);
  }

  @override
  void dispose() {
    _router.dispose();
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [AppLocales.en, AppLocales.vi],
      path: AppLocales.path,
      fallbackLocale: AppLocales.vi,
      startLocale: AppLocales.vi,
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ScreenUtilInit(
          designSize: const Size(414, 896),
          minTextAdapt: true,
          splitScreenMode: true,
          useInheritedMediaQuery: true,
          child: MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _authBloc),
            ],
            child: Builder(
              builder: (context) => MaterialApp.router(
                routerConfig: _router,
                title: widget.flavor.title,
                theme: terraLightTheme,
                themeMode: ThemeMode.light,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
