import 'package:ai_character_chat_mobile/common/theme/terra_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Terra colors retain exact stakeholder values', () {
    const colors = TerraColors.light;
    expect(colors.primary, const Color(0xFF4A7C59));
    expect(colors.primaryDark, const Color(0xFF34583E));
    expect(colors.terracotta, const Color(0xFFC86D51));
    expect(colors.surface, const Color(0xFFFBF9F6));
    expect(colors.textPrimary, const Color(0xFF1F2923));
    expect(colors.error, const Color(0xFFB3261E));
  });

  test('approved primary pair passes WCAG normal text contrast', () {
    expect(
      TerraColors.contrastRatio(
        TerraColors.light.onPrimary,
        TerraColors.light.primary,
      ),
      greaterThanOrEqualTo(4.5),
    );
  });
}
