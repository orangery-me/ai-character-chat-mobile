import 'dart:async';

import 'package:ai_character_chat_mobile/presentation/auth/bloc/auth/auth_bloc.dart';
import 'package:ai_character_chat_mobile/presentation/auth/views/login_view.dart';
import 'package:ai_character_chat_mobile/presentation/auth/views/register_view.dart';
import 'package:ai_character_chat_mobile/presentation/core/views/root_view.dart';
import 'package:ai_character_chat_mobile/presentation/splash/view/splash_view.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

abstract final class AppRouter {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String root = '/root';

  static GoRouter create({required AuthBloc authBloc}) {
    return GoRouter(
      initialLocation: splash,
      refreshListenable: _RouterRefresh(authBloc.stream),
      redirect: (context, state) => _redirect(authBloc.state, state.uri.path),
      routes: <RouteBase>[
        GoRoute(path: splash, builder: (context, state) => const SplashPage()),
        GoRoute(path: login, builder: (context, state) => const LoginPage()),
        GoRoute(
          path: register,
          builder: (context, state) => const RegisterView(),
        ),
        GoRoute(path: root, builder: (context, state) => const RootPage()),
      ],
    );
  }

  static String? _redirect(AuthState auth, String location) {
    switch (auth.status) {
      case AuthenticationStatus.startup:
      case AuthenticationStatus.authenticating:
        return location == splash ? null : splash;
      case AuthenticationStatus.authenticated:
        return location == root ? null : root;
      case AuthenticationStatus.unauthenticated:
      case AuthenticationStatus.sessionExpired:
        if (location == login || location == register) return null;
        return login;
    }
  }
}

class _RouterRefresh extends ChangeNotifier {
  _RouterRefresh(Stream<AuthState> stream) {
    _subscription = stream.listen((event) => notifyListeners());
  }

  late final StreamSubscription<AuthState> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
