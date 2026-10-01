import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';

enum StatusIntent { neutral, online, warning, unread }

@immutable
class AvatarPresentation {
  const AvatarPresentation({
    required this.image,
    required this.initials,
    required this.semanticLabel,
    required this.statusLabel,
    required this.statusIntent,
    required this.showStatus,
  });
  final ImagePresentation image;
  final String initials;
  final String semanticLabel;
  final String? statusLabel;
  final StatusIntent statusIntent;
  final bool showStatus;
}

@immutable
class FilterChipPresentation {
  const FilterChipPresentation({
    required this.label,
    required this.semanticLabel,
    required this.selected,
    required this.enabled,
  });
  final String label;
  final String semanticLabel;
  final bool selected;
  final bool enabled;
}

@immutable
class SectionPresentation {
  const SectionPresentation({
    required this.title,
    required this.subtitle,
    required this.trailingAction,
  });
  final String title;
  final String? subtitle;
  final ActionPresentation? trailingAction;
}

@immutable
class PageHeaderPresentation {
  const PageHeaderPresentation({
    required this.eyebrow,
    required this.title,
    required this.subtitle,
    required this.avatar,
  });
  final String? eyebrow;
  final String title;
  final String? subtitle;
  final AvatarPresentation? avatar;
}

@immutable
class MetricPresentation {
  const MetricPresentation({
    required this.value,
    required this.label,
    required this.supportingLabel,
    required this.icon,
  });
  final String value;
  final String label;
  final String? supportingLabel;
  final IconData? icon;
}

@immutable
class CalloutPresentation {
  const CalloutPresentation({
    required this.eyebrow,
    required this.title,
    required this.body,
    required this.action,
  });
  final String? eyebrow;
  final String title;
  final String body;
  final ActionPresentation action;
}

@immutable
class NumberedSectionPresentation {
  const NumberedSectionPresentation({
    required this.number,
    required this.title,
    required this.subtitle,
  });
  final String number;
  final String title;
  final String? subtitle;
}

@immutable
class MenuItemPresentation {
  const MenuItemPresentation({
    required this.title,
    required this.subtitle,
    required this.trailingLabel,
    required this.icon,
  });
  final String title;
  final String? subtitle;
  final String? trailingLabel;
  final IconData icon;
}
