import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/component_presentation.dart';
import 'package:flutter/foundation.dart';

@immutable
class CharacterCreationPresentation {
  const CharacterCreationPresentation({
    required this.imageSection,
    required this.image,
    required this.generateImage,
    required this.uploadImage,
    required this.basicSection,
    required this.name,
    required this.role,
    required this.personalitySection,
    required this.relationshipLabel,
    required this.relationships,
    required this.personalityLabel,
    required this.personalities,
    required this.contextSection,
    required this.prompt,
    required this.greeting,
    required this.submit,
    required this.notice,
  });
  final NumberedSectionPresentation imageSection;
  final ImagePresentation image;
  final ActionPresentation generateImage;
  final ActionPresentation uploadImage;
  final NumberedSectionPresentation basicSection;
  final InputPresentation name;
  final InputPresentation role;
  final NumberedSectionPresentation personalitySection;
  final String relationshipLabel;
  final List<FilterChipPresentation> relationships;
  final String personalityLabel;
  final List<FilterChipPresentation> personalities;
  final NumberedSectionPresentation contextSection;
  final InputPresentation prompt;
  final InputPresentation greeting;
  final ActionPresentation submit;
  final String notice;
}
