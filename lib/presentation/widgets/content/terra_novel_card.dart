import 'package:ai_character_chat_mobile/presentation/widgets/media/terra_image_frame.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_action_group.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/content_presentation.dart';
import 'package:flutter/material.dart';

enum NovelCardVariant { compact, featured }

class TerraNovelCard extends StatelessWidget {
  const TerraNovelCard({
    required this.presentation,
    required this.variant,
    required this.onSelected,
    required this.onSecondaryAction,
    super.key,
  });
  final NovelCardPresentation presentation;
  final NovelCardVariant variant;
  final VoidCallback onSelected;
  final VoidCallback? onSecondaryAction;
  @override
  Widget build(BuildContext context) => Card(
    child: InkWell(
      onTap: onSelected,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: variant == NovelCardVariant.featured
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _content(context),
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 88,
                    child: TerraImageFrame(
                      presentation: presentation.image,
                      aspectRatio: 3 / 4,
                      borderRadius: BorderRadius.circular(12),
                      onRetry: null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _text(context),
                    ),
                  ),
                ],
              ),
      ),
    ),
  );
  List<Widget> _content(BuildContext context) => <Widget>[
    TerraImageFrame(
      presentation: presentation.image,
      aspectRatio: 16 / 9,
      borderRadius: BorderRadius.circular(12),
      onRetry: null,
    ),
    const SizedBox(height: 12),
    ..._text(context),
  ];
  List<Widget> _text(BuildContext context) => <Widget>[
    Text(presentation.title, style: Theme.of(context).textTheme.titleMedium),
    Text(presentation.author, style: Theme.of(context).textTheme.labelMedium),
    if (presentation.tags.isNotEmpty) ...<Widget>[
      const SizedBox(height: 8),
      Wrap(
        spacing: 6,
        runSpacing: 6,
        children: presentation.tags
            .map((String tag) => Chip(label: Text(tag)))
            .toList(),
      ),
    ],
    const SizedBox(height: 8),
    Text(presentation.summary, maxLines: 3, overflow: TextOverflow.ellipsis),
    if (presentation.progressLabel != null) ...<Widget>[
      const SizedBox(height: 8),
      Text(
        presentation.progressLabel!,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    ],
    if (presentation.readerLabel != null)
      Text(
        presentation.readerLabel!,
        style: Theme.of(context).textTheme.labelSmall,
      ),
    if (variant == NovelCardVariant.featured) ...<Widget>[
      const SizedBox(height: 12),
      TerraActionGroup(
        primary: presentation.action,
        secondary: presentation.secondaryAction,
        onPrimaryPressed: onSelected,
        onSecondaryPressed: onSecondaryAction,
      ),
    ],
  ];
}
