import 'package:ai_character_chat_mobile/presentation/widgets/models/content_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/foundation.dart';

@immutable
class ChatPresentation {
  const ChatPresentation({
    required this.title,
    required this.messages,
    required this.input,
  });
  final String title;
  final List<ChatBubblePresentation> messages;
  final InputPresentation input;
}
