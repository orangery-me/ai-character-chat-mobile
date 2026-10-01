import 'package:flutter/material.dart';

@immutable
class TerraTypography extends ThemeExtension<TerraTypography> {
  const TerraTypography({
    required this.displaySmall,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
  });
  static const TerraTypography standard = TerraTypography(
    displaySmall: TextStyle(
      fontFamily: 'Literata',
      fontSize: 32,
      height: 1.25,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Literata',
      fontSize: 28,
      height: 36 / 28,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Literata',
      fontSize: 24,
      height: 32 / 24,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Literata',
      fontSize: 20,
      height: 1.4,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Literata',
      fontSize: 18,
      height: 24 / 18,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Literata',
      fontSize: 16,
      height: 22 / 16,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: 16,
      height: 1.5,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: 12,
      height: 1.5,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w700,
    ),
    labelMedium: TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: 11,
      height: 16 / 11,
      fontWeight: FontWeight.w600,
    ),
  );
  final TextStyle displaySmall;
  final TextStyle headlineMedium;
  final TextStyle headlineSmall;
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;
  TextTheme textTheme(Color primary, Color secondary) => TextTheme(
    displaySmall: displaySmall.copyWith(color: primary),
    headlineMedium: headlineMedium.copyWith(color: primary),
    headlineSmall: headlineSmall.copyWith(color: primary),
    titleLarge: titleLarge.copyWith(color: primary),
    titleMedium: titleMedium.copyWith(color: primary),
    titleSmall: titleSmall.copyWith(color: primary),
    bodyLarge: bodyLarge.copyWith(color: primary),
    bodyMedium: bodyMedium.copyWith(color: primary),
    bodySmall: bodySmall.copyWith(color: secondary),
    labelLarge: labelLarge.copyWith(color: primary),
    labelMedium: labelMedium.copyWith(color: primary),
    labelSmall: labelSmall.copyWith(color: secondary),
  );
  @override
  TerraTypography copyWith() => this;
  @override
  TerraTypography lerp(covariant TerraTypography? other, double t) =>
      t < 0.5 || other == null ? this : other;
}
