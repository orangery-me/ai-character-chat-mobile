import 'package:ai_character_chat_mobile/presentation/widgets/models/component_presentation.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/content_presentation.dart';
import 'package:flutter/foundation.dart';

@immutable
class ProfilePresentation {
  const ProfilePresentation({
    required this.header,
    required this.metrics,
    required this.creatorCallout,
    required this.segments,
    required this.characterSection,
    required this.characters,
    required this.accountSection,
    required this.accountItems,
  });
  final PageHeaderPresentation header;
  final List<MetricPresentation> metrics;
  final CalloutPresentation creatorCallout;
  final List<FilterChipPresentation> segments;
  final SectionPresentation characterSection;
  final List<CharacterCardPresentation> characters;
  final SectionPresentation accountSection;
  final List<MenuItemPresentation> accountItems;
}
