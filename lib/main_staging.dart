import 'package:ai_character_chat_mobile/app/app.dart';
import 'package:ai_character_chat_mobile/bootstrap.dart';
import 'package:ai_character_chat_mobile/flavors.dart';

Future<void> main() async {
  await bootstrap(() {
    return const App(flavor: Flavor.STAGING);
  }, Flavor.STAGING);
}
