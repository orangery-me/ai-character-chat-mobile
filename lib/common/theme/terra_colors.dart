import 'dart:math' as math;
import 'package:flutter/material.dart';

@immutable
class TerraColors extends ThemeExtension<TerraColors> {
  const TerraColors({
    required this.primary,
    required this.primaryDark,
    required this.primaryLight,
    required this.primaryContainer,
    required this.onPrimary,
    required this.secondary,
    required this.secondaryContainer,
    required this.terracotta,
    required this.surface,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.online,
    required this.warning,
    required this.badgeBackground,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
  });
  static const TerraColors light = TerraColors(
    primary: Color(0xFF4A7C59),
    primaryDark: Color(0xFF34583E),
    primaryLight: Color(0xFF6B9B79),
    primaryContainer: Color(0xFFD8EBD9),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFF8C7A6B),
    secondaryContainer: Color(0xFFEDE6DF),
    terracotta: Color(0xFFC86D51),
    surface: Color(0xFFFBF9F6),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFF5F3F0),
    surfaceContainer: Color(0xFFEEEBE6),
    surfaceContainerHigh: Color(0xFFE7E4DE),
    surfaceContainerHighest: Color(0xFFDEDAD2),
    textPrimary: Color(0xFF1F2923),
    textSecondary: Color(0xFF4B554E),
    textMuted: Color(0xFF78827B),
    online: Color(0xFF2E7D32),
    warning: Color(0xFFE67E22),
    badgeBackground: Color(0xFFE4F0E7),
    error: Color(0xFFB3261E),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFF9DEDC),
    onErrorContainer: Color(0xFF410E0B),
  );
  final Color primary;
  final Color primaryDark;
  final Color primaryLight;
  final Color primaryContainer;
  final Color onPrimary;
  final Color secondary;
  final Color secondaryContainer;
  final Color terracotta;
  final Color surface;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color online;
  final Color warning;
  final Color badgeBackground;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  static double contrastRatio(Color foreground, Color background) {
    final lighter = math.max(
      foreground.computeLuminance(),
      background.computeLuminance(),
    );
    final darker = math.min(
      foreground.computeLuminance(),
      background.computeLuminance(),
    );
    return (lighter + 0.05) / (darker + 0.05);
  }

  @override
  TerraColors copyWith() => this;
  @override
  TerraColors lerp(covariant TerraColors? other, double t) =>
      t < 0.5 || other == null ? this : other;
}
