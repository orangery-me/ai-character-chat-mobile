import 'package:ai_character_chat_mobile/common/theme/palette.dart';
import 'package:ai_character_chat_mobile/common/theme/terra_colors.dart';
import 'package:ai_character_chat_mobile/common/theme/terra_layout.dart';
import 'package:ai_character_chat_mobile/common/theme/terra_typography.dart';
import 'package:ai_character_chat_mobile/common/theme/text_styles.dart';
import 'package:flutter/material.dart';

final ThemeData terraLightTheme = _buildTerraLightTheme();

ThemeData _buildTerraLightTheme() {
  const TerraColors colors = TerraColors.light;
  const TerraTypography typography = TerraTypography.standard;
  final ColorScheme colorScheme = ColorScheme.light(
    primary: colors.primary,
    onPrimary: colors.onPrimary,
    primaryContainer: colors.primaryContainer,
    onPrimaryContainer: colors.primaryDark,
    secondary: colors.secondary,
    onSecondary: colors.textPrimary,
    secondaryContainer: colors.secondaryContainer,
    onSecondaryContainer: colors.textPrimary,
    tertiary: colors.terracotta,
    onTertiary: colors.textPrimary,
    surface: colors.surface,
    onSurface: colors.textPrimary,
    error: colors.error,
    onError: colors.onError,
    errorContainer: colors.errorContainer,
    onErrorContainer: colors.onErrorContainer,
    outline: colors.surfaceContainerHigh,
    outlineVariant: colors.surfaceContainerHighest,
  );
  final TextTheme textTheme = typography.textTheme(
    colors.textPrimary,
    colors.textSecondary,
  );
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colors.surface,
    fontFamily: 'NunitoSans',
    textTheme: textTheme,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: colors.surface,
      foregroundColor: colors.textPrimary,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: typography.titleLarge.copyWith(color: colors.textPrimary),
    ),
    cardTheme: CardThemeData(
      color: colors.surfaceContainerLowest,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TerraRadii.standard.card),
        side: BorderSide(color: colors.surfaceContainerHigh),
      ),
    ),
    searchBarTheme: SearchBarThemeData(
      backgroundColor: WidgetStatePropertyAll(colors.surfaceContainerLowest),
      elevation: const WidgetStatePropertyAll(0),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 16),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TerraRadii.standard.input),
        ),
      ),
      side: WidgetStatePropertyAll(
        BorderSide(color: colors.surfaceContainerHigh),
      ),
      textStyle: WidgetStatePropertyAll(textTheme.bodyMedium),
      hintStyle: WidgetStatePropertyAll(
        textTheme.bodyMedium?.copyWith(color: colors.textSecondary),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: colors.surfaceContainerLowest,
      selectedColor: colors.primaryContainer,
      disabledColor: colors.surfaceContainerHighest,
      labelStyle: typography.labelMedium.copyWith(color: colors.textPrimary),
      side: BorderSide(color: colors.surfaceContainerHigh),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TerraRadii.standard.pill),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: colors.surface,
      elevation: 0,
      height: TerraSizes.standard.bottomNavigationHeight,
      indicatorColor: colors.primaryContainer,
      labelTextStyle: WidgetStatePropertyAll(typography.labelSmall),
    ),
    bottomAppBarTheme: BottomAppBarThemeData(
      color: colors.surfaceContainerLowest,
      elevation: 8,
      height: TerraSizes.standard.bottomNavigationHeight,
      padding: EdgeInsets.zero,
      shape: const CircularNotchedRectangle(),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colors.primary,
      foregroundColor: colors.onPrimary,
      elevation: 2,
      focusElevation: 3,
      hoverElevation: 3,
      shape: const CircleBorder(),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(48, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TerraRadii.standard.pill),
        ),
        textStyle: typography.labelLarge,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(48, 48),
        side: BorderSide(color: colors.surfaceContainerHighest),
        foregroundColor: colors.textPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TerraRadii.standard.pill),
        ),
        textStyle: typography.labelLarge,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colors.surfaceContainerLowest,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(TerraRadii.standard.input),
        borderSide: BorderSide(color: colors.surfaceContainerHigh),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(TerraRadii.standard.input),
        borderSide: BorderSide(color: colors.surfaceContainerHigh),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(TerraRadii.standard.input),
        borderSide: BorderSide(color: colors.primary, width: 2),
      ),
    ),
    extensions: <ThemeExtension<dynamic>>[
      colors,
      TerraSpacing.standard,
      TerraRadii.standard,
      TerraSizes.standard,
      typography,
      Palette.light(),
      AppTextStyles.fromTerra(colors, typography),
    ],
  );
}

class ThemeSheet {
  ThemeSheet({required this.palette, required this.textStyles})
    : themeData = terraLightTheme;
  final ThemeData themeData;
  final Palette palette;
  final AppTextStyles textStyles;
}
