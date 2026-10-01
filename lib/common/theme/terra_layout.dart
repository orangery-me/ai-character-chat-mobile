import 'package:flutter/material.dart';

@immutable
class TerraSpacing extends ThemeExtension<TerraSpacing> {
  const TerraSpacing({
    required this.space4,
    required this.space8,
    required this.space12,
    required this.space16,
    required this.space20,
    required this.space24,
    required this.space32,
    required this.space40,
    required this.space48,
  });
  static const TerraSpacing standard = TerraSpacing(
    space4: 4,
    space8: 8,
    space12: 12,
    space16: 16,
    space20: 20,
    space24: 24,
    space32: 32,
    space40: 40,
    space48: 48,
  );
  final double space4;
  final double space8;
  final double space12;
  final double space16;
  final double space20;
  final double space24;
  final double space32;
  final double space40;
  final double space48;
  @override
  TerraSpacing copyWith() => this;
  @override
  TerraSpacing lerp(covariant TerraSpacing? other, double t) =>
      t < 0.5 || other == null ? this : other;
}

@immutable
class TerraRadii extends ThemeExtension<TerraRadii> {
  const TerraRadii({
    required this.control,
    required this.input,
    required this.card,
    required this.hero,
    required this.sheet,
    required this.pill,
  });
  static const TerraRadii standard = TerraRadii(
    control: 8,
    input: 12,
    card: 16,
    hero: 24,
    sheet: 28,
    pill: 999,
  );
  final double control;
  final double input;
  final double card;
  final double hero;
  final double sheet;
  final double pill;
  @override
  TerraRadii copyWith() => this;
  @override
  TerraRadii lerp(covariant TerraRadii? other, double t) =>
      t < 0.5 || other == null ? this : other;
}

@immutable
class TerraSizes extends ThemeExtension<TerraSizes> {
  const TerraSizes({
    required this.minimumTarget,
    required this.pagePadding,
    required this.cardPadding,
    required this.bottomNavigationHeight,
    required this.avatarSmall,
    required this.avatarMedium,
    required this.avatarLarge,
  });
  static const TerraSizes standard = TerraSizes(
    minimumTarget: 48,
    pagePadding: 16,
    cardPadding: 16,
    bottomNavigationHeight: 72,
    avatarSmall: 32,
    avatarMedium: 48,
    avatarLarge: 72,
  );
  final double minimumTarget;
  final double pagePadding;
  final double cardPadding;
  final double bottomNavigationHeight;
  final double avatarSmall;
  final double avatarMedium;
  final double avatarLarge;
  @override
  TerraSizes copyWith() => this;
  @override
  TerraSizes lerp(covariant TerraSizes? other, double t) =>
      t < 0.5 || other == null ? this : other;
}

abstract final class TerraMotion {
  static const Duration feedback = Duration(milliseconds: 150);
  static const Duration surface = Duration(milliseconds: 250);
}
