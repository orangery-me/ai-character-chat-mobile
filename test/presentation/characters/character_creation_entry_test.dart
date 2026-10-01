import 'package:ai_character_chat_mobile/common/theme/app_theme.dart';
import 'package:ai_character_chat_mobile/presentation/characters/views/character_creation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets('creation entry is focused and never reports saved success', (
    tester,
  ) async {
    final router = GoRouter(
      initialLocation: '/characters/create',
      routes: <RouteBase>[
        GoRoute(
          path: '/characters/create',
          builder: (_, __) => const CharacterCreationPage(),
        ),
      ],
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      MaterialApp.router(theme: terraLightTheme, routerConfig: router),
    );
    await tester.pumpAndSettle();
    expect(find.text('Tạo nhân vật AI mới'), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);
    expect(find.textContaining('thành công'), findsNothing);
  });
}
