import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';

class TerraPrimaryButton extends StatelessWidget {
  const TerraPrimaryButton({
    required this.presentation,
    required this.onPressed,
    required this.expand,
    super.key,
  });
  final ActionPresentation presentation;
  final VoidCallback onPressed;
  final bool expand;
  @override
  Widget build(BuildContext context) {
    final button = Semantics(
      label: presentation.semanticLabel,
      button: true,
      enabled: presentation.canActivate,
      child: SizedBox(
        height: 48,
        child: FilledButton(
          onPressed: presentation.canActivate ? onPressed : null,
          child: presentation.state == ActionState.loading
              ? const SizedBox.square(
                  dimension: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(presentation.label),
        ),
      ),
    );
    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}
