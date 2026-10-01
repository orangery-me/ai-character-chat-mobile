import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_action_group.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/media/terra_image_frame.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/content_presentation.dart';
import 'package:flutter/material.dart';

enum CharacterCardVariant { compact, featured }

class TerraCharacterCard extends StatelessWidget {
  const TerraCharacterCard({
    required this.presentation,
    required this.variant,
    required this.onSelected,
    required this.onPrimaryAction,
    required this.onSecondaryAction,
    super.key,
  });
  final CharacterCardPresentation presentation;
  final CharacterCardVariant variant;
  final VoidCallback onSelected;
  final VoidCallback onPrimaryAction;
  final VoidCallback? onSecondaryAction;
  @override
  Widget build(BuildContext context) => Semantics(
    label: '${presentation.name}, ${presentation.role}',
    button: true,
    child: Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onSelected,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TerraImageFrame(
                presentation: presentation.image,
                aspectRatio: variant == CharacterCardVariant.featured
                    ? 16 / 10
                    : 1,
                borderRadius: BorderRadius.circular(12),
                onRetry: null,
              ),
              const SizedBox(height: 12),
              Text(
                presentation.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                presentation.role,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              if (presentation.statusLabel != null)
                Text(
                  presentation.statusLabel!,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              if (variant == CharacterCardVariant.featured) ...<Widget>[
                const SizedBox(height: 8),
                Text(presentation.description),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: presentation.tags
                      .map((String value) => Chip(label: Text(value)))
                      .toList(),
                ),
                const SizedBox(height: 12),
                if (presentation.metadataLabel != null) ...<Widget>[
                  Text(
                    presentation.metadataLabel!,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(height: 8),
                ],
                TerraActionGroup(
                  primary: presentation.primaryAction,
                  secondary: presentation.secondaryAction,
                  onPrimaryPressed: onPrimaryAction,
                  onSecondaryPressed: onSecondaryAction,
                ),
              ],
            ],
          ),
        ),
      ),
    ),
  );
}
