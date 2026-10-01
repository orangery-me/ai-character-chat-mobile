import 'package:ai_character_chat_mobile/presentation/widgets/actions/terra_secondary_button.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';

class TerraEmptyState extends StatelessWidget {
  const TerraEmptyState({
    required this.presentation,
    required this.onAction,
    super.key,
  });
  final EmptyPresentation presentation;
  final VoidCallback? onAction;
  @override
  Widget build(BuildContext context) => Semantics(
    label: '${presentation.title}. ${presentation.message}',
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(Icons.auto_stories_outlined, size: 48),
          const SizedBox(height: 12),
          Text(
            presentation.title,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(presentation.message, textAlign: TextAlign.center),
          if (presentation.action != null && onAction != null) ...<Widget>[
            const SizedBox(height: 16),
            TerraSecondaryButton(
              presentation: presentation.action!,
              onPressed: onAction!,
              expand: false,
            ),
          ],
        ],
      ),
    ),
  );
}
