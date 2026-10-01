import 'package:ai_character_chat_mobile/common/theme/terra_colors.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_bento_card.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/component_presentation.dart';
import 'package:flutter/material.dart';

class TerraMenuList extends StatelessWidget {
  const TerraMenuList({
    required this.presentations,
    required this.onSelected,
    super.key,
  });
  final List<MenuItemPresentation> presentations;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<TerraColors>()!;
    return TerraBentoCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: List<Widget>.generate(presentations.length, (int index) {
          final item = presentations[index];
          return Column(
            children: <Widget>[
              ListTile(
                minTileHeight: 64,
                leading: Icon(item.icon, color: colors.primary),
                title: Text(item.title),
                subtitle: item.subtitle == null ? null : Text(item.subtitle!),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (item.trailingLabel != null)
                      Text(
                        item.trailingLabel!,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    const Icon(Icons.chevron_right),
                  ],
                ),
                onTap: () => onSelected(index),
              ),
              if (index < presentations.length - 1)
                Divider(height: 1, color: colors.surfaceContainerHigh),
            ],
          );
        }),
      ),
    );
  }
}
