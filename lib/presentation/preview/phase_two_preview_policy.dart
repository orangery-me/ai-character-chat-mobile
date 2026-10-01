import 'package:ai_character_chat_mobile/flavors.dart';

enum PhaseTwoPreviewPolicy {
  fixtures(true),
  explicitEmpty(false);

  const PhaseTwoPreviewPolicy(this.usesFixtures);
  final bool usesFixtures;

  factory PhaseTwoPreviewPolicy.forFlavor(Flavor flavor) {
    return switch (flavor) {
      Flavor.DEV || Flavor.STAGING => PhaseTwoPreviewPolicy.fixtures,
      Flavor.PROD => PhaseTwoPreviewPolicy.explicitEmpty,
    };
  }
}
