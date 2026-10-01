import 'package:ai_character_chat_mobile/presentation/widgets/inputs/terra_filter_chip.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/component_presentation.dart';
import 'package:flutter/material.dart';

class TerraChipGroup extends StatelessWidget {
  const TerraChipGroup({
    required this.presentations,
    required this.onSelected,
    super.key,
  });
  final List<FilterChipPresentation> presentations;
  final void Function(int index, bool selected) onSelected;

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: 8,
    runSpacing: 8,
    children: List<Widget>.generate(
      presentations.length,
      (int index) => TerraFilterChip(
        presentation: presentations[index],
        onSelected: (bool selected) => onSelected(index, selected),
      ),
    ),
  );
}
