import 'package:ai_character_chat_mobile/presentation/widgets/models/content_presentation.dart';
import 'package:flutter/foundation.dart';

@immutable
class CharacterDetailPresentation {
  const CharacterDetailPresentation({required this.character});
  final CharacterCardPresentation character;
}
