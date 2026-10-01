import 'package:ai_character_chat_mobile/common/theme/app_theme.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/media/terra_image_frame.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('image variants preserve aspect-ratio geometry', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: terraLightTheme,
        home: const Scaffold(
          body: Center(
            child: SizedBox(
              width: 200,
              child: TerraImageFrame(
                presentation: ImagePresentation(
                  assetPath: null,
                  semanticLabel: 'Placeholder',
                  state: ImageState.placeholder,
                ),
                aspectRatio: 2,
                borderRadius: BorderRadius.all(Radius.circular(16)),
                onRetry: null,
              ),
            ),
          ),
        ),
      ),
    );
    expect(tester.getSize(find.byType(AspectRatio)), const Size(200, 100));
  });
}
