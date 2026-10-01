import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_bento_card.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/component_presentation.dart';
import 'package:flutter/material.dart';

class TerraNumberedSection extends StatelessWidget {
  const TerraNumberedSection({
    required this.presentation,
    required this.child,
    super.key,
  });
  final NumberedSectionPresentation presentation;
  final Widget child;

  @override
  Widget build(BuildContext context) => TerraBentoCard(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          presentation.number,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(presentation.title, style: Theme.of(context).textTheme.titleLarge),
        if (presentation.subtitle != null) ...<Widget>[
          const SizedBox(height: 4),
          Text(
            presentation.subtitle!,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
        const SizedBox(height: 16),
        child,
      ],
    ),
  );
}
