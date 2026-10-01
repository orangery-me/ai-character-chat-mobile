import 'package:ai_character_chat_mobile/common/theme/app_theme.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/inputs/terra_prompt_input.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('prompt input renders presenter-provided error and count', (
    tester,
  ) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);
    const presentation = InputPresentation(
      label: 'Prompt',
      hint: 'Describe',
      value: '',
      errorText: 'Required',
      helperText: null,
      countLabel: '0 / 500',
      enabled: true,
      readOnly: false,
    );
    await tester.pumpWidget(
      MaterialApp(
        theme: terraLightTheme,
        home: Scaffold(
          body: TerraPromptInput(
            presentation: presentation,
            controller: controller,
            minimumLines: 3,
            maximumLines: 5,
            onChanged: (_) {},
            onFocusChanged: (_) {},
          ),
        ),
      ),
    );
    expect(find.text('Required'), findsOneWidget);
    expect(find.text('0 / 500'), findsOneWidget);
  });
}
