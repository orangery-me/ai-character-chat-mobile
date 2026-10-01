import 'package:ai_character_chat_mobile/common/theme/app_theme.dart';
import 'package:ai_character_chat_mobile/presentation/characters/views/character_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets('focused route hides shell chrome', (tester) async {
    final router = GoRouter(
      initialLocation: '/characters/an',
      routes: <RouteBase>[
        GoRoute(
          path: '/characters/:id',
          builder: (_, state) =>
              CharacterDetailView(characterId: state.pathParameters['id']!),
        ),
      ],
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      MaterialApp.router(theme: terraLightTheme, routerConfig: router),
    );
    await tester.pumpAndSettle();
    expect(find.byType(NavigationBar), findsNothing);
    expect(find.byType(FloatingActionButton), findsNothing);
  });
}
