import 'package:ai_character_chat_mobile/presentation/widgets/media/terra_avatar.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/component_presentation.dart';
import 'package:flutter/material.dart';

class TerraPageHeader extends StatelessWidget {
  const TerraPageHeader({
    required this.presentation,
    required this.actions,
    required this.onAvatarPressed,
    super.key,
  });
  final PageHeaderPresentation presentation;
  final List<Widget> actions;
  final VoidCallback? onAvatarPressed;

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (presentation.eyebrow != null)
              Text(
                presentation.eyebrow!,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            Text(
              presentation.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            if (presentation.subtitle != null)
              Text(
                presentation.subtitle!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
          ],
        ),
      ),
      ...actions,
      if (presentation.avatar != null) ...<Widget>[
        const SizedBox(width: 8),
        TerraAvatar(
          presentation: presentation.avatar!,
          size: 40,
          onPressed: onAvatarPressed,
        ),
      ],
    ],
  );
}
