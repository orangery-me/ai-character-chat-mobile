import 'package:ai_character_chat_mobile/presentation/widgets/models/content_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/component_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/foundation.dart';

@immutable
class MessagesPresentation {
  const MessagesPresentation({
    required this.header,
    required this.search,
    required this.onlineSection,
    required this.onlineAvatars,
    required this.filters,
    required this.conversationSection,
    required this.conversations,
    required this.suggestion,
  });
  final PageHeaderPresentation header;
  final InputPresentation search;
  final SectionPresentation onlineSection;
  final List<AvatarPresentation> onlineAvatars;
  final List<FilterChipPresentation> filters;
  final SectionPresentation conversationSection;
  final List<ConversationPresentation> conversations;
  final CalloutPresentation suggestion;
}
