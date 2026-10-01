import 'package:ai_character_chat_mobile/common/theme/app_theme.dart';
import 'package:ai_character_chat_mobile/presentation/preview/phase_two_fixture_catalog.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_character_card.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_chat_bubble.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/content_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('character card emits typed selection intent', (tester) async {
    int selections = 0;
    await tester.pumpWidget(
      MaterialApp(
        theme: terraLightTheme,
        home: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: 280,
              child: TerraCharacterCard(
                presentation: PhaseTwoFixtureCatalog.featuredCharacter,
                variant: CharacterCardVariant.featured,
                onSelected: () => selections++,
                onPrimaryAction: () {},
                onSecondaryAction: () {},
              ),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('An'));
    expect(selections, 1);
  });
  testWidgets('chat bubble identifies speaker beyond color', (tester) async {
    const presentation = ChatBubblePresentation(
      message: 'Xin chào',
      timeLabel: '09:00',
      speaker: ChatSpeaker.character,
      speakerLabel: 'An',
    );
    await tester.pumpWidget(
      MaterialApp(
        theme: terraLightTheme,
        home: const TerraChatBubble(presentation: presentation),
      ),
    );
    expect(find.text('An'), findsOneWidget);
  });
}
