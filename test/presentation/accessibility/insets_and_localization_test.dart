import 'package:ai_character_chat_mobile/common/theme/app_theme.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/overlays/terra_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('bottom sheet remains scrollable with keyboard and long copy', (
    tester,
  ) async {
    const action = ActionPresentation(
      label: 'Tiếp tục',
      semanticLabel: 'Tiếp tục',
      state: ActionState.enabled,
    );
    final longCopy = List<String>.filled(40, 'Nội dung dài').join(' ');
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(
          size: Size(320, 568),
          viewInsets: EdgeInsets.only(bottom: 280),
          textScaler: TextScaler.linear(2),
        ),
        child: MaterialApp(
          theme: terraLightTheme,
          home: Scaffold(
            body: TerraBottomSheet(
              title: 'Một tiêu đề bản địa hóa rất dài',
              content: Text(longCopy),
              primaryAction: action,
              dismissible: true,
              onPrimary: _noop,
            ),
          ),
        ),
      ),
    );
    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

void _noop() {}
