import 'package:ai_character_chat_mobile/presentation/widgets/models/content_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/component_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/foundation.dart';

@immutable
class NovelsPresentation {
  const NovelsPresentation({
    required this.header,
    required this.search,
    required this.categories,
    required this.featuredSection,
    required this.featured,
    required this.storyCharacterSection,
    required this.storyCharacters,
    required this.roleplayCallout,
    required this.trendingSection,
    required this.trending,
  });
  final PageHeaderPresentation header;
  final InputPresentation search;
  final List<FilterChipPresentation> categories;
  final SectionPresentation featuredSection;
  final NovelCardPresentation featured;
  final SectionPresentation storyCharacterSection;
  final List<AvatarPresentation> storyCharacters;
  final CalloutPresentation roleplayCallout;
  final SectionPresentation trendingSection;
  final List<NovelCardPresentation> trending;
}
