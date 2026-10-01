import 'package:ai_character_chat_mobile/presentation/widgets/models/content_presentation.dart';
import 'package:flutter/material.dart';

class TerraChatBubble extends StatelessWidget {
  const TerraChatBubble({required this.presentation, super.key});
  final ChatBubblePresentation presentation;
  @override
  Widget build(BuildContext context) {
    final member = presentation.speaker == ChatSpeaker.member;
    return Semantics(
      label:
          '${presentation.speakerLabel}: ${presentation.message}, ${presentation.timeLabel}',
      child: Align(
        alignment: member ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 300),
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: member
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.surfaceContainerLowest,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(16),
              topRight: const Radius.circular(16),
              bottomLeft: Radius.circular(member ? 16 : 4),
              bottomRight: Radius.circular(member ? 4 : 16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                presentation.speakerLabel,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(presentation.message),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  presentation.timeLabel,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
