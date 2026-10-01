import 'package:ai_character_chat_mobile/common/theme/terra_colors.dart';
import 'package:ai_character_chat_mobile/common/theme/terra_layout.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/component_presentation.dart';
import 'package:flutter/material.dart';

class TerraMetricGrid extends StatelessWidget {
  const TerraMetricGrid({
    required this.presentations,
    required this.minimumItemWidth,
    super.key,
  });
  final List<MetricPresentation> presentations;
  final double minimumItemWidth;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      final itemWidth = constraints.maxWidth < minimumItemWidth * 2 + 12
          ? constraints.maxWidth
          : (constraints.maxWidth - 12) / 2;
      return Wrap(
        spacing: 12,
        runSpacing: 12,
        children: presentations
            .map(
              (MetricPresentation item) => SizedBox(
                width: itemWidth,
                child: TerraMetricCard(presentation: item),
              ),
            )
            .toList(),
      );
    },
  );
}

class TerraMetricCard extends StatelessWidget {
  const TerraMetricCard({required this.presentation, super.key});
  final MetricPresentation presentation;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<TerraColors>()!;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(TerraRadii.standard.input),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (presentation.icon != null)
              Icon(presentation.icon, size: 20, color: colors.primary),
            Text(
              presentation.value,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              presentation.label,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            if (presentation.supportingLabel != null)
              Text(
                presentation.supportingLabel!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
          ],
        ),
      ),
    );
  }
}
