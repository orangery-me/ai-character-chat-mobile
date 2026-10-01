import 'package:ai_character_chat_mobile/presentation/widgets/actions/terra_secondary_button.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';

class TerraRetry extends StatelessWidget {
  const TerraRetry({
    required this.presentation,
    required this.onRetry,
    super.key,
  });
  final ErrorPresentation presentation;
  final VoidCallback onRetry;
  @override
  Widget build(BuildContext context) {
    final action = presentation.retry;
    return action == null
        ? const SizedBox.shrink()
        : TerraSecondaryButton(
            presentation: action,
            onPressed: onRetry,
            expand: false,
          );
  }
}
