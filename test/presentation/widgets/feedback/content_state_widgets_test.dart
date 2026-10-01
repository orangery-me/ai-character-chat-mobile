import 'package:ai_character_chat_mobile/common/theme/app_theme.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/feedback/content_state_view.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('content state renders only the active variant', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: terraLightTheme,
        home: ContentStateView<String>(
          state: const ContentState<String>.content('ready'),
          onRetry: () {},
          contentBuilder: (_, value) => Text(value),
        ),
      ),
    );
    expect(find.text('ready'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });
}
