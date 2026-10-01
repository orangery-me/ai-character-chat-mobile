import 'package:ai_character_chat_mobile/common/theme/terra_colors.dart';
import 'package:ai_character_chat_mobile/common/theme/terra_layout.dart';
import 'package:flutter/material.dart';

class TerraBentoCard extends StatelessWidget {
  const TerraBentoCard({required this.child, required this.padding, super.key});
  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<TerraColors>()!;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(TerraRadii.standard.card),
        border: Border.all(color: colors.surfaceContainerHigh),
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}

class TerraEmphasisCard extends StatelessWidget {
  const TerraEmphasisCard({
    required this.child,
    required this.padding,
    super.key,
  });
  final Widget child;
  final EdgeInsetsGeometry padding;

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
        borderRadius: BorderRadius.circular(TerraRadii.standard.hero),
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}
