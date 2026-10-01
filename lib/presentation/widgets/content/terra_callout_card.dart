import 'package:ai_character_chat_mobile/common/theme/terra_colors.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/actions/terra_primary_button.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/component_presentation.dart';
import 'package:flutter/material.dart';

class TerraCalloutCard extends StatelessWidget {
  const TerraCalloutCard({
    required this.presentation,
    required this.onPressed,
    super.key,
  });
  final CalloutPresentation presentation;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<TerraColors>()!;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[colors.primaryDark, colors.primary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (presentation.eyebrow != null)
              Text(
                presentation.eyebrow!,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(color: colors.onPrimary),
              ),
            Text(
              presentation.title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: colors.onPrimary),
            ),
            const SizedBox(height: 6),
            Text(
              presentation.body,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: colors.onPrimary),
            ),
            const SizedBox(height: 16),
            TerraPrimaryButton(
              presentation: presentation.action,
              onPressed: onPressed,
              expand: false,
            ),
          ],
        ),
      ),
    );
  }
}
