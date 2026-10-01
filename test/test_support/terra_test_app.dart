import 'dart:io';

import 'package:ai_character_chat_mobile/common/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

Widget terraTestApp({
  required Widget child,
  required Size size,
  required double textScale,
}) {
  return MediaQuery(
    data: MediaQueryData(size: size, textScaler: TextScaler.linear(textScale)),
    child: MaterialApp(theme: terraLightTheme, home: child),
  );
}

Future<void> loadTerraFonts(WidgetTester tester) async {
  await tester.runAsync(() async {
    final literata = FontLoader('Literata')
      ..addFont(rootBundle.load('assets/fonts/Literata-Variable.ttf'));
    final nunitoSans = FontLoader('NunitoSans')
      ..addFont(rootBundle.load('assets/fonts/NunitoSans-Variable.ttf'));
    final materialIcons = FontLoader('MaterialIcons')
      ..addFont(
        File(
          '.fvm/flutter_sdk/bin/cache/artifacts/material_fonts/'
          'MaterialIcons-Regular.otf',
        ).readAsBytes().then(ByteData.sublistView),
      );
    await Future.wait(<Future<void>>[
      literata.load(),
      nunitoSans.load(),
      materialIcons.load(),
    ]);
  });
}

Future<void> precacheTerraPreviewImages(WidgetTester tester) async {
  final context = tester.element(find.byType(MaterialApp));
  await tester.runAsync(() async {
    await Future.wait(<Future<void>>[
      precacheImage(
        const AssetImage('assets/images/preview/character_portrait_v2.png'),
        context,
      ),
      precacheImage(
        const AssetImage('assets/images/preview/featured_story_v2.png'),
        context,
      ),
    ]);
  });
  await tester.pump();
}
