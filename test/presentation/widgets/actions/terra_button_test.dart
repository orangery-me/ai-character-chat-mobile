import 'package:ai_character_chat_mobile/common/theme/app_theme.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/actions/terra_primary_button.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('disabled and loading buttons do not emit actions', (
    tester,
  ) async {
    int taps = 0;
    await tester.pumpWidget(
      MaterialApp(
        theme: terraLightTheme,
        home: Column(
          children: <Widget>[
            TerraPrimaryButton(
              presentation: const ActionPresentation(
                label: 'Disabled',
                semanticLabel: 'Disabled',
                state: ActionState.disabled,
              ),
              onPressed: () => taps++,
              expand: false,
            ),
            TerraPrimaryButton(
              presentation: const ActionPresentation(
                label: 'Loading',
                semanticLabel: 'Loading',
                state: ActionState.loading,
              ),
              onPressed: () => taps++,
              expand: false,
            ),
          ],
        ),
      ),
    );
    await tester.tap(find.text('Disabled'));
    await tester.tap(find.byType(CircularProgressIndicator));
    expect(taps, 0);
  });
}
