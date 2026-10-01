import 'package:ai_character_chat_mobile/presentation/widgets/actions/terra_primary_button.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/actions/terra_secondary_button.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';

class TerraActionGroup extends StatelessWidget {
  const TerraActionGroup({
    required this.primary,
    required this.secondary,
    required this.onPrimaryPressed,
    required this.onSecondaryPressed,
    super.key,
  });
  final ActionPresentation primary;
  final ActionPresentation? secondary;
  final VoidCallback onPrimaryPressed;
  final VoidCallback? onSecondaryPressed;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      final secondaryButton = secondary == null || onSecondaryPressed == null
          ? null
          : TerraSecondaryButton(
              presentation: secondary!,
              onPressed: onSecondaryPressed!,
              expand: true,
            );
      if (secondaryButton == null) {
        return TerraPrimaryButton(
          presentation: primary,
          onPressed: onPrimaryPressed,
          expand: true,
        );
      }
      return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          SizedBox(
            width: constraints.maxWidth < 320
                ? constraints.maxWidth
                : (constraints.maxWidth - 8) / 2,
            child: TerraPrimaryButton(
              presentation: primary,
              onPressed: onPrimaryPressed,
              expand: true,
            ),
          ),
          SizedBox(
            width: constraints.maxWidth < 320
                ? constraints.maxWidth
                : (constraints.maxWidth - 8) / 2,
            child: secondaryButton,
          ),
        ],
      );
    },
  );
}
