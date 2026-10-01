import 'package:ai_character_chat_mobile/presentation/widgets/models/component_presentation.dart';
import 'package:flutter/material.dart';

class TerraFilterChip extends StatelessWidget {
  const TerraFilterChip({
    required this.presentation,
    required this.onSelected,
    super.key,
  });
  final FilterChipPresentation presentation;
  final ValueChanged<bool> onSelected;
  @override
  Widget build(BuildContext context) => Semantics(
    label: presentation.semanticLabel,
    selected: presentation.selected,
    enabled: presentation.enabled,
    button: true,
    child: FilterChip(
      label: Text(presentation.label),
      selected: presentation.selected,
      onSelected: presentation.enabled ? onSelected : null,
    ),
  );
}
