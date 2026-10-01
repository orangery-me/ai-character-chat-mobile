import 'package:ai_character_chat_mobile/common/theme/app_theme.dart';
import 'package:ai_character_chat_mobile/presentation/core/models/app_destination.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/navigation/terra_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('bottom navigation exposes exactly four destinations', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: terraLightTheme,
        home: Scaffold(
          bottomNavigationBar: TerraBottomNavigation(
            selected: AppDestination.explore,
            creationLabel: 'Tạo mới',
            onSelected: (_) {},
          ),
        ),
      ),
    );
    expect(find.byType(TerraNavigationDestination), findsNWidgets(4));
    expect(find.text('Tạo nhân vật'), findsNothing);
  });

  testWidgets('bottom navigation reserves a separate central creation space', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: terraLightTheme,
        home: Scaffold(
          bottomNavigationBar: TerraBottomNavigation(
            selected: AppDestination.explore,
            creationLabel: 'Tạo mới',
            onSelected: (_) {},
          ),
        ),
      ),
    );

    expect(find.text('Tạo mới'), findsOneWidget);
    expect(find.byType(TerraNavigationDestination), findsNWidgets(4));
  });

  testWidgets('bottom navigation fits a small screen at 200 percent text', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
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
          bottomNavigationBar: TerraBottomNavigation(
            selected: AppDestination.explore,
            creationLabel: 'Tạo mới',
            onSelected: (_) {},
          ),
        ),
      ),
    );
    await tester.pump();

    expect(tester.takeException(), isNull);
  });
}
