import 'package:ai_character_chat_mobile/common/theme/app_theme.dart';
import 'package:ai_character_chat_mobile/presentation/preview/phase_two_fixture_catalog.dart';
import 'package:ai_character_chat_mobile/presentation/core/models/app_destination.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/actions/character_creation_action.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_character_card.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_novel_card.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/navigation/terra_bottom_navigation.dart';
import '../../test_support/terra_test_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Terra catalog light theme', (tester) async {
    await loadTerraFonts(tester);
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      MaterialApp(
        theme: terraLightTheme,
        home: Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: <Widget>[
              TerraCharacterCard(
                presentation: PhaseTwoFixtureCatalog.featuredCharacter,
                variant: CharacterCardVariant.featured,
                onSelected: _noop,
                onPrimaryAction: _noop,
                onSecondaryAction: _noop,
              ),
              const SizedBox(height: 16),
              TerraNovelCard(
                presentation: PhaseTwoFixtureCatalog.featuredNovel,
                variant: NovelCardVariant.compact,
                onSelected: _noop,
                onSecondaryAction: _noop,
              ),
            ],
          ),
        ),
      ),
    );
    await precacheTerraPreviewImages(tester);
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(Scaffold),
      matchesGoldenFile('goldens/design_system.png'),
    );
  });

  testWidgets('Terra shell chrome keeps creation separate from four areas', (
    tester,
  ) async {
    await loadTerraFonts(tester);
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      MaterialApp(
        theme: terraLightTheme,
        home: Scaffold(
          body: const Center(child: Text('App shell')),
          bottomNavigationBar: TerraBottomNavigation(
            selected: AppDestination.explore,
            creationLabel: 'Tạo mới',
            onSelected: (_) {},
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: CharacterCreationAction(
            presentation: PhaseTwoFixtureCatalog.createAction,
            onPressed: _noop,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(Scaffold),
      matchesGoldenFile('goldens/shell_chrome.png'),
    );
  });
}

void _noop() {}
