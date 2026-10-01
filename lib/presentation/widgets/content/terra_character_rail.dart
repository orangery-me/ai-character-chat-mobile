import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_character_card.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_section_title.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/content_presentation.dart';
import 'package:flutter/material.dart';

class TerraCharacterRail extends StatelessWidget {
  const TerraCharacterRail({
    required this.presentation,
    required this.onCharacterSelected,
    required this.onPrimaryAction,
    required this.onSecondaryAction,
    required this.onTrailingPressed,
    super.key,
  });
  final CharacterRailPresentation presentation;
  final ValueChanged<String> onCharacterSelected;
  final ValueChanged<String> onPrimaryAction;
  final ValueChanged<String>? onSecondaryAction;
  final VoidCallback? onTrailingPressed;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      TerraSectionTitle(
        presentation: presentation.section,
        onTrailingPressed: onTrailingPressed,
      ),
      const SizedBox(height: 12),
      SizedBox(
        height: 250,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: presentation.characters.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (BuildContext context, int index) {
            final item = presentation.characters[index];
            return SizedBox(
              width: 172,
              child: TerraCharacterCard(
                presentation: item,
                variant: CharacterCardVariant.compact,
                onSelected: () => onCharacterSelected(item.id),
                onPrimaryAction: () => onPrimaryAction(item.id),
                onSecondaryAction: onSecondaryAction == null
                    ? null
                    : () => onSecondaryAction!(item.id),
              ),
            );
          },
        ),
      ),
    ],
  );
}
