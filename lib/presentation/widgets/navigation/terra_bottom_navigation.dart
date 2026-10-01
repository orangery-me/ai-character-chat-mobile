import 'package:ai_character_chat_mobile/common/theme/terra_colors.dart';
import 'package:ai_character_chat_mobile/common/theme/terra_layout.dart';
import 'package:ai_character_chat_mobile/presentation/core/models/app_destination.dart';
import 'package:flutter/material.dart';

class TerraBottomNavigation extends StatelessWidget {
  const TerraBottomNavigation({
    required this.selected,
    required this.creationLabel,
    required this.onSelected,
    super.key,
  });
  final AppDestination selected;
  final String creationLabel;
  final ValueChanged<AppDestination> onSelected;

  @override
  Widget build(BuildContext context) {
    final destinations = AppDestination.values;
    return BottomAppBar(
      notchMargin: 8,
      child: SafeArea(
        top: false,
        child: Row(
          children: <Widget>[
            for (final destination in destinations.take(2))
              Expanded(
                child: TerraNavigationDestination(
                  destination: destination,
                  selected: destination == selected,
                  onPressed: () => onSelected(destination),
                ),
              ),
            SizedBox(
              width: 72,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    creationLabel,
                    style: Theme.of(context).textTheme.labelSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            for (final destination in destinations.skip(2))
              Expanded(
                child: TerraNavigationDestination(
                  destination: destination,
                  selected: destination == selected,
                  onPressed: () => onSelected(destination),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class TerraNavigationDestination extends StatelessWidget {
  const TerraNavigationDestination({
    required this.destination,
    required this.selected,
    required this.onPressed,
    super.key,
  });
  final AppDestination destination;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<TerraColors>()!;
    final label = destination.labelFor(Localizations.localeOf(context));
    final foreground = selected ? colors.primaryDark : colors.textSecondary;
    return Semantics(
      label: label,
      selected: selected,
      button: true,
      child: InkResponse(
        onTap: onPressed,
        radius: TerraSizes.standard.minimumTarget / 2,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: TerraSizes.standard.minimumTarget,
            minHeight: TerraSizes.standard.minimumTarget,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: selected
                        ? colors.primaryContainer
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      TerraRadii.standard.pill,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 3,
                    ),
                    child: Icon(
                      selected ? destination.selectedIcon : destination.icon,
                      color: foreground,
                      size: 22,
                    ),
                  ),
                ),
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall?.copyWith(color: foreground),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
