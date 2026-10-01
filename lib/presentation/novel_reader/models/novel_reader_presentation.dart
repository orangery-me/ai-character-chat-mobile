import 'package:flutter/foundation.dart';

@immutable
class NovelReaderPresentation {
  const NovelReaderPresentation({
    required this.title,
    required this.chapterLabel,
    required this.body,
    required this.progressLabel,
  });
  final String title;
  final String chapterLabel;
  final String body;
  final String progressLabel;
}
