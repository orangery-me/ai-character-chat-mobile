import 'package:ai_character_chat_mobile/common/theme/app_theme.dart';
import 'package:ai_character_chat_mobile/presentation/preview/phase_two_fixture_catalog.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_action_group.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_bento_card.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_chip_group.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_metric_grid.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_numbered_section.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/content/terra_page_header.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/component_presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shared bento compositions remain usable at 200 percent text', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    int primaryActivations = 0;

    await tester.pumpWidget(
      MaterialApp(
        theme: terraLightTheme,
        builder: (BuildContext context, Widget? child) => MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(2)),
          child: child!,
        ),
        home: Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: <Widget>[
              TerraPageHeader(
                presentation: PhaseTwoFixtureCatalog.exploreHeader,
                actions: const <Widget>[],
                onAvatarPressed: null,
              ),
              const SizedBox(height: 12),
              TerraBentoCard(
                padding: const EdgeInsets.all(16),
                child: TerraMetricGrid(
                  presentations: PhaseTwoFixtureCatalog.profileMetrics,
                  minimumItemWidth: 112,
                ),
              ),
              const SizedBox(height: 12),
              TerraChipGroup(
                presentations: PhaseTwoFixtureCatalog.messageFilters,
                onSelected: (_, __) {},
              ),
              const SizedBox(height: 12),
              TerraNumberedSection(
                presentation: const NumberedSectionPresentation(
                  number: '01',
                  title: 'Thông tin cơ bản',
                  subtitle: 'Mô tả hiển thị',
                ),
                child: const Text('Nội dung'),
              ),
              const SizedBox(height: 12),
              TerraActionGroup(
                primary: PhaseTwoFixtureCatalog.enabledChat,
                secondary: PhaseTwoFixtureCatalog.previewAction,
                onPrimaryPressed: () => primaryActivations++,
                onSecondaryPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pump();

    expect(tester.takeException(), isNull);
    await tester.scrollUntilVisible(
      find.text('Trò chuyện'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Trò chuyện'));
    expect(primaryActivations, 1);
  });
}
