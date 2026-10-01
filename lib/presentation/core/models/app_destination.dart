import 'package:flutter/material.dart';

enum AppDestination {
  explore(
    '/explore',
    'Khám phá',
    'Explore',
    Icons.explore_outlined,
    Icons.explore,
  ),
  messages(
    '/messages',
    'Tin nhắn',
    'Messages',
    Icons.chat_bubble_outline,
    Icons.chat_bubble,
  ),
  novels(
    '/novels',
    'Tiểu thuyết',
    'Novels',
    Icons.auto_stories_outlined,
    Icons.auto_stories,
  ),
  profile('/profile', 'Cá nhân', 'Profile', Icons.person_outline, Icons.person);

  const AppDestination(
    this.path,
    this.vietnameseLabel,
    this.englishLabel,
    this.icon,
    this.selectedIcon,
  );
  final String path;
  final String vietnameseLabel;
  final String englishLabel;
  final IconData icon;
  final IconData selectedIcon;

  String labelFor(Locale locale) =>
      locale.languageCode == 'en' ? englishLabel : vietnameseLabel;
}
