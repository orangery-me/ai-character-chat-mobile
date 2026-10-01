import 'package:ai_character_chat_mobile/presentation/widgets/media/terra_avatar.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/content_presentation.dart';
import 'package:flutter/material.dart';

class TerraConversationCard extends StatelessWidget {
  const TerraConversationCard({
    required this.presentation,
    required this.onPressed,
    super.key,
  });
  final ConversationPresentation presentation;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) => Semantics(
    label: '${presentation.name}. ${presentation.statusLabel}',
    button: true,
    child: ListTile(
      minTileHeight: 72,
      onTap: onPressed,
      leading: TerraAvatar(
        presentation: presentation.avatar,
        size: 48,
        onPressed: null,
      ),
      title: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              presentation.name,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          if (presentation.pinned)
            const Icon(Icons.push_pin_outlined, size: 16),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (presentation.relationshipLabel != null)
            Text(
              presentation.relationshipLabel!,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          Text(
            presentation.preview,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            presentation.mediaLabel == null
                ? presentation.timeLabel
                : '${presentation.timeLabel} · ${presentation.mediaLabel}',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
      trailing: presentation.unreadCount > 0
          ? Badge(label: Text('${presentation.unreadCount}'))
          : null,
    ),
  );
}
