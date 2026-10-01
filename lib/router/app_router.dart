import 'dart:async';

import 'package:ai_character_chat_mobile/flavors.dart';
import 'package:ai_character_chat_mobile/presentation/auth/bloc/auth/auth_bloc.dart';
import 'package:ai_character_chat_mobile/presentation/auth/views/login_view.dart';
import 'package:ai_character_chat_mobile/presentation/auth/views/register_view.dart';
import 'package:ai_character_chat_mobile/presentation/characters/views/character_creation_view.dart';
import 'package:ai_character_chat_mobile/presentation/characters/views/character_detail_view.dart';
import 'package:ai_character_chat_mobile/presentation/chat/views/chat_view.dart';
import 'package:ai_character_chat_mobile/presentation/core/views/app_shell_view.dart';
import 'package:ai_character_chat_mobile/presentation/explore/bloc/explore_cubit.dart';
import 'package:ai_character_chat_mobile/presentation/explore/views/explore_view.dart';
import 'package:ai_character_chat_mobile/presentation/messages/bloc/messages_cubit.dart';
import 'package:ai_character_chat_mobile/presentation/messages/views/messages_view.dart';
import 'package:ai_character_chat_mobile/presentation/novel_reader/views/novel_reader_view.dart';
import 'package:ai_character_chat_mobile/presentation/novels/bloc/novels_cubit.dart';
import 'package:ai_character_chat_mobile/presentation/novels/views/novels_view.dart';
import 'package:ai_character_chat_mobile/presentation/preview/phase_two_preview_policy.dart';
import 'package:ai_character_chat_mobile/presentation/profile/view/profile_view.dart';
import 'package:ai_character_chat_mobile/presentation/splash/view/splash_view.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/feedback/unavailable_route_state.dart';
import 'package:ai_character_chat_mobile/router/intended_destination_policy.dart';
import 'package:ai_character_chat_mobile/router/route_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract final class AppRouter {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String root = '/root';
  static const String explore = '/explore';
  static const String messages = '/messages';
  static const String novels = '/novels';
  static const String profile = '/profile';

  static GoRouter create({required AuthBloc authBloc, required Flavor flavor}) {
    final rootNavigatorKey = GlobalKey<NavigatorState>();
    final exploreNavigatorKey = GlobalKey<NavigatorState>();
    final messagesNavigatorKey = GlobalKey<NavigatorState>();
    final novelsNavigatorKey = GlobalKey<NavigatorState>();
    final profileNavigatorKey = GlobalKey<NavigatorState>();
    final policy = IntendedDestinationPolicy();
    final preview = PhaseTwoPreviewPolicy.forFlavor(flavor);
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: splash,
      refreshListenable: _RouterRefresh(authBloc.stream),
      redirect: (BuildContext context, GoRouterState state) =>
          _redirect(authBloc.state, state.uri.path, policy),
      errorBuilder: (BuildContext context, GoRouterState state) =>
          UnavailableRouteState(onBack: () => context.go(explore)),
      routes: <RouteBase>[
        GoRoute(path: splash, builder: (_, __) => const SplashPage()),
        GoRoute(path: login, builder: (_, __) => const LoginPage()),
        GoRoute(path: register, builder: (_, __) => const RegisterView()),
        GoRoute(path: root, redirect: (_, __) => explore),
        StatefulShellRoute.indexedStack(
          builder:
              (
                BuildContext context,
                GoRouterState state,
                StatefulNavigationShell shell,
              ) => AppShellView(navigationShell: shell),
          branches: <StatefulShellBranch>[
            StatefulShellBranch(
              navigatorKey: exploreNavigatorKey,
              routes: <RouteBase>[
                GoRoute(
                  path: explore,
                  builder: (_, __) => BlocProvider<ExploreCubit>(
                    create: (_) =>
                        ExploreCubit(usesFixtures: preview.usesFixtures),
                    child: const ExploreView(),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: messagesNavigatorKey,
              routes: <RouteBase>[
                GoRoute(
                  path: messages,
                  builder: (_, __) => BlocProvider<MessagesCubit>(
                    create: (_) =>
                        MessagesCubit(usesFixtures: preview.usesFixtures),
                    child: const MessagesView(),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: novelsNavigatorKey,
              routes: <RouteBase>[
                GoRoute(
                  path: novels,
                  builder: (_, __) => BlocProvider<NovelsCubit>(
                    create: (_) =>
                        NovelsCubit(usesFixtures: preview.usesFixtures),
                    child: const NovelsView(),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: profileNavigatorKey,
              routes: <RouteBase>[
                GoRoute(
                  path: profile,
                  builder: (_, __) =>
                      ProfilePage(usesFixtures: preview.usesFixtures),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          parentNavigatorKey: rootNavigatorKey,
          path: '/characters/create',
          builder: (_, __) => const CharacterCreationPage(),
        ),
        GoRoute(
          parentNavigatorKey: rootNavigatorKey,
          path: '/characters/:characterId',
          builder: (BuildContext context, GoRouterState state) {
            final value = RouteValue.tryParse(
              state.pathParameters['characterId'],
            );
            return value == null
                ? UnavailableRouteState(onBack: () => context.go(explore))
                : CharacterDetailView(characterId: value.value);
          },
        ),
        GoRoute(
          parentNavigatorKey: rootNavigatorKey,
          path: '/conversations/:conversationId',
          builder: (BuildContext context, GoRouterState state) {
            final value = RouteValue.tryParse(
              state.pathParameters['conversationId'],
            );
            return value == null
                ? UnavailableRouteState(onBack: () => context.go(messages))
                : ChatView(conversationId: value.value);
          },
        ),
        GoRoute(
          parentNavigatorKey: rootNavigatorKey,
          path: '/novels/:novelId/chapters/:chapterId',
          builder: (BuildContext context, GoRouterState state) {
            final novel = RouteValue.tryParse(state.pathParameters['novelId']);
            final chapter = RouteValue.tryParse(
              state.pathParameters['chapterId'],
            );
            return novel == null || chapter == null
                ? UnavailableRouteState(onBack: () => context.go(novels))
                : NovelReaderView(
                    novelId: novel.value,
                    chapterId: chapter.value,
                  );
          },
        ),
      ],
    );
  }

  static String? _redirect(
    AuthState auth,
    String location,
    IntendedDestinationPolicy policy,
  ) {
    switch (auth.status) {
      case AuthenticationStatus.startup:
      case AuthenticationStatus.authenticating:
        if (location != splash) {
          policy.retain(location);
        }
        return location == splash ? null : splash;
      case AuthenticationStatus.authenticated:
        if (location == splash || location == login || location == register) {
          return policy.consume() ?? explore;
        }
        return null;
      case AuthenticationStatus.unauthenticated:
      case AuthenticationStatus.sessionExpired:
        if (location == login || location == register) {
          return null;
        }
        if (location != splash) {
          policy.retain(location);
        }
        return login;
    }
  }
}

class _RouterRefresh extends ChangeNotifier {
  _RouterRefresh(Stream<AuthState> stream) {
    _subscription = stream.listen((AuthState event) => notifyListeners());
  }
  late final StreamSubscription<AuthState> _subscription;
  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
