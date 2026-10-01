import 'package:ai_character_chat_mobile/common/theme/app_theme.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/overlays/terra_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('confirmation dialog exposes explicit actions', (tester) async {
    const enabled = ActionPresentation(
      label: 'Confirm',
      semanticLabel: 'Confirm',
      state: ActionState.enabled,
    );
    const cancel = ActionPresentation(
      label: 'Cancel',
      semanticLabel: 'Cancel',
      state: ActionState.enabled,
    );
    await tester.pumpWidget(
      MaterialApp(
        theme: terraLightTheme,
        home: const TerraConfirmationDialog(
          title: 'Title',
          body: 'Body',
          primaryAction: enabled,
          secondaryAction: cancel,
          dismissible: false,
          onConfirm: _noop,
          onCancel: _noop,
        ),
      ),
    );
    expect(find.text('Confirm'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
  });
}

void _noop() {}
