import 'package:ai_character_chat_mobile/presentation/core/models/app_destination.dart';
import 'package:ai_character_chat_mobile/router/route_value.dart';

sealed class FocusedDestination {
  const FocusedDestination({required this.parent});
  final AppDestination parent;
}

class CharacterDetailDestination extends FocusedDestination {
  const CharacterDetailDestination({required this.characterId})
    : super(parent: AppDestination.explore);
  final RouteValue characterId;
}

class ConversationDestination extends FocusedDestination {
  const ConversationDestination({required this.conversationId})
    : super(parent: AppDestination.messages);
  final RouteValue conversationId;
}

class NovelReaderDestination extends FocusedDestination {
  const NovelReaderDestination({required this.novelId, required this.chapterId})
    : super(parent: AppDestination.novels);
  final RouteValue novelId;
  final RouteValue chapterId;
}
