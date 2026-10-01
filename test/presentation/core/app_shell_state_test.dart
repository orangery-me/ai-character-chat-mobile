import 'package:ai_character_chat_mobile/presentation/core/bloc/app_shell_state.dart';
import 'package:ai_character_chat_mobile/presentation/core/models/app_destination.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('destinations have the approved order and paths', () {
    expect(AppDestination.values.map((value) => value.path), <String>[
      '/explore',
      '/messages',
      '/novels',
      '/profile',
    ]);
  });
  test('reselection increments only the active destination revision', () {
    final state = AppShellState.initial().select(AppDestination.explore);
    expect(state.reselectionRevisions[AppDestination.explore], 1);
    expect(state.selected, AppDestination.explore);
  });
}
