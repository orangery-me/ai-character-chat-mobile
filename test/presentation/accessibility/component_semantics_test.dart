import 'package:ai_character_chat_mobile/common/theme/app_theme.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/actions/terra_primary_button.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('actions meet the 48 pixel target and expose semantics', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: terraLightTheme,
        home: Scaffold(
          body: TerraPrimaryButton(
            presentation: const ActionPresentation(
              label: 'Continue',
              semanticLabel: 'Continue story',
              state: ActionState.enabled,
            ),
            onPressed: () {},
            expand: false,
          ),
        ),
      ),
    );
    expect(
      tester.getSize(find.byType(FilledButton)).height,
      greaterThanOrEqualTo(48),
    );
    expect(find.bySemanticsLabel('Continue story'), findsOneWidget);
  });
}
