import 'package:ai_character_chat_mobile/presentation/widgets/models/component_presentation.dart';
import 'package:flutter/material.dart';

class TerraSectionTitle extends StatelessWidget {
  const TerraSectionTitle({
    required this.presentation,
    required this.onTrailingPressed,
    super.key,
  });
  final SectionPresentation presentation;
  final VoidCallback? onTrailingPressed;
  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              presentation.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            if (presentation.subtitle != null)
              Text(
                presentation.subtitle!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
          ],
        ),
      ),
      if (presentation.trailingAction != null && onTrailingPressed != null)
        TextButton(
          onPressed: presentation.trailingAction!.canActivate
              ? onTrailingPressed
              : null,
          child: Text(presentation.trailingAction!.label),
        ),
    ],
  );
}
