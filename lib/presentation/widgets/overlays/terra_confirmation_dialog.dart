import 'package:ai_character_chat_mobile/presentation/widgets/actions/terra_primary_button.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/actions/terra_secondary_button.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';

class TerraConfirmationDialog extends StatelessWidget {
  const TerraConfirmationDialog({
    required this.title,
    required this.body,
    required this.primaryAction,
    required this.secondaryAction,
    required this.dismissible,
    required this.onConfirm,
    required this.onCancel,
    super.key,
  });
  final String title;
  final String body;
  final ActionPresentation primaryAction;
  final ActionPresentation secondaryAction;
  final bool dismissible;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  @override
  Widget build(BuildContext context) => PopScope(
    canPop: dismissible,
    child: AlertDialog(
      title: Text(title),
      content: Text(body),
      actions: <Widget>[
        TerraSecondaryButton(
          presentation: secondaryAction,
          onPressed: onCancel,
          expand: false,
        ),
        TerraPrimaryButton(
          presentation: primaryAction,
          onPressed: onConfirm,
          expand: false,
        ),
      ],
    ),
  );
}
