import 'package:ai_character_chat_mobile/common/theme/app_theme.dart';
import 'package:ai_character_chat_mobile/common/theme/terra_colors.dart';
import 'package:ai_character_chat_mobile/common/theme/terra_layout.dart';
import 'package:ai_character_chat_mobile/common/theme/terra_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('theme is Material 3 light with Terra extensions', () {
    expect(terraLightTheme.useMaterial3, isTrue);
    expect(terraLightTheme.brightness, Brightness.light);
    expect(terraLightTheme.extension<TerraSpacing>()?.space24, 24);
    expect(terraLightTheme.extension<TerraSizes>()?.minimumTarget, 48);
    expect(
      terraLightTheme.extension<TerraTypography>()?.titleLarge.fontFamily,
      'Literata',
    );
  });

  test('theme defines soft reusable search, chip, and navigation surfaces', () {
    final colors = terraLightTheme.extension<TerraColors>()!;

    expect(
      terraLightTheme.searchBarTheme.backgroundColor?.resolve(<WidgetState>{}),
      colors.surfaceContainerLowest,
    );
    expect(
      terraLightTheme.searchBarTheme.elevation?.resolve(<WidgetState>{}),
      0,
    );
    expect(terraLightTheme.navigationBarTheme.backgroundColor, colors.surface);
    expect(terraLightTheme.chipTheme.side?.color, colors.surfaceContainerHigh);
  });
}
