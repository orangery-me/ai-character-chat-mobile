import 'package:ai_character_chat_mobile/common/theme/app_theme.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/actions/character_creation_action.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('creation action is separate, semantic, and at least 48 pixels', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: terraLightTheme,
        home: Scaffold(
          floatingActionButton: CharacterCreationAction(
            presentation: const ActionPresentation(
              label: 'Create',
              semanticLabel: 'Create character',
              state: ActionState.enabled,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
    expect(
      tester.getSize(find.byType(FloatingActionButton)).height,
      greaterThanOrEqualTo(48),
    );
    expect(find.bySemanticsLabel('Create character'), findsOneWidget);
    expect(find.byType(NavigationDestination), findsNothing);
  });
}
