import 'package:ai_character_chat_mobile/flavors.dart';
import 'package:ai_character_chat_mobile/presentation/preview/phase_two_preview_policy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('development and staging use fixtures, production does not', () {
    expect(PhaseTwoPreviewPolicy.forFlavor(Flavor.DEV).usesFixtures, isTrue);
    expect(
      PhaseTwoPreviewPolicy.forFlavor(Flavor.STAGING).usesFixtures,
      isTrue,
    );
    expect(PhaseTwoPreviewPolicy.forFlavor(Flavor.PROD).usesFixtures, isFalse);
  });
}
