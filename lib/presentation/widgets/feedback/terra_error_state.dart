import 'package:ai_character_chat_mobile/presentation/widgets/actions/terra_retry.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';

class TerraErrorState extends StatelessWidget {
  const TerraErrorState({
    required this.presentation,
    required this.onRetry,
    super.key,
  });
  final ErrorPresentation presentation;
  final VoidCallback? onRetry;
  @override
  Widget build(BuildContext context) => Semantics(
    liveRegion: true,
    label: '${presentation.title}. ${presentation.message}',
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.error_outline,
            color: Theme.of(context).colorScheme.error,
            size: 48,
          ),
          const SizedBox(height: 12),
          Text(
            presentation.title,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(presentation.message, textAlign: TextAlign.center),
          if (onRetry != null) ...<Widget>[
            const SizedBox(height: 16),
            TerraRetry(presentation: presentation, onRetry: onRetry!),
          ],
        ],
      ),
    ),
  );
}
