import 'package:ai_character_chat_mobile/presentation/widgets/models/component_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/foundation.dart';

@immutable
class CharacterCardPresentation {
  const CharacterCardPresentation({
    required this.id,
    required this.name,
    required this.role,
    required this.description,
    required this.image,
    required this.tags,
    required this.metadataLabel,
    required this.statusLabel,
    required this.primaryAction,
    required this.secondaryAction,
  });
  final String id;
  final String name;
  final String role;
  final String description;
  final ImagePresentation image;
  final List<String> tags;
  final String? metadataLabel;
  final String? statusLabel;
  final ActionPresentation primaryAction;
  final ActionPresentation? secondaryAction;
}

@immutable
class CharacterRailPresentation {
  const CharacterRailPresentation({
    required this.section,
    required this.characters,
  });
  final SectionPresentation section;
  final List<CharacterCardPresentation> characters;
}

@immutable
class NovelCardPresentation {
  const NovelCardPresentation({
    required this.id,
    required this.title,
    required this.author,
    required this.summary,
    required this.progressLabel,
    required this.image,
    required this.tags,
    required this.readerLabel,
    required this.bookmarkLabel,
    required this.action,
    required this.secondaryAction,
  });
  final String id;
  final String title;
  final String author;
  final String summary;
  final String? progressLabel;
  final ImagePresentation image;
  final List<String> tags;
  final String? readerLabel;
  final String? bookmarkLabel;
  final ActionPresentation action;
  final ActionPresentation? secondaryAction;
}

enum ChatSpeaker { member, character }

@immutable
class ChatBubblePresentation {
  const ChatBubblePresentation({
    required this.message,
    required this.timeLabel,
    required this.speaker,
    required this.speakerLabel,
  });
  final String message;
  final String timeLabel;
  final ChatSpeaker speaker;
  final String speakerLabel;
}

@immutable
class ConversationPresentation {
  const ConversationPresentation({
    required this.id,
    required this.name,
    required this.preview,
    required this.timeLabel,
    required this.statusLabel,
    required this.relationshipLabel,
    required this.mediaLabel,
    required this.avatar,
    required this.unreadCount,
    required this.pinned,
  });
  final String id;
  final String name;
  final String preview;
  final String timeLabel;
  final String statusLabel;
  final String? relationshipLabel;
  final String? mediaLabel;
  final AvatarPresentation avatar;
  final int unreadCount;
  final bool pinned;
}
