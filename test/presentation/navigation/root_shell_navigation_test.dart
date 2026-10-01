import 'package:ai_character_chat_mobile/presentation/core/models/app_destination.dart';
import 'package:ai_character_chat_mobile/router/app_router.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('root compatibility and four stateful branch contracts are stable', () {
    expect(AppRouter.root, '/root');
    expect(AppRouter.explore, '/explore');
    expect(AppDestination.values, hasLength(4));
  });
}
