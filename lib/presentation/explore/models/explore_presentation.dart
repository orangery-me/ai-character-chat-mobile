import 'package:ai_character_chat_mobile/presentation/widgets/models/content_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/component_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/foundation.dart';

@immutable
class ExplorePresentation {
  const ExplorePresentation({
    required this.header,
    required this.search,
    required this.filters,
    required this.featuredSection,
    required this.featured,
    required this.recommendedSection,
    required this.recommended,
    required this.creationCallout,
    required this.popularSection,
    required this.popular,
  });
  final PageHeaderPresentation header;
  final InputPresentation search;
  final List<FilterChipPresentation> filters;
  final SectionPresentation featuredSection;
  final CharacterCardPresentation featured;
  final SectionPresentation recommendedSection;
  final List<CharacterCardPresentation> recommended;
  final CalloutPresentation creationCallout;
  final SectionPresentation popularSection;
  final List<CharacterCardPresentation> popular;
}
