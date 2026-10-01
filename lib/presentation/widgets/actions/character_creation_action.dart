import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';

class CharacterCreationAction extends StatelessWidget {
  const CharacterCreationAction({
    required this.presentation,
    required this.onPressed,
    super.key,
  });
  final ActionPresentation presentation;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) => Semantics(
    label: presentation.semanticLabel,
    button: true,
    enabled: presentation.canActivate,
    child: SizedBox.square(
      dimension: 56,
      child: FloatingActionButton(
        onPressed: presentation.canActivate ? onPressed : null,
        tooltip: presentation.semanticLabel,
        child: presentation.state == ActionState.loading
            ? const CircularProgressIndicator()
            : const Icon(Icons.add_rounded, size: 28),
      ),
    ),
  );
}
