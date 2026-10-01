import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('content variants are mutually exclusive values', () {
    const state = ContentState<String>.content('ready');
    expect(state, const ContentState<String>.content('ready'));
    expect(state, isNot(const ContentState<String>.loading()));
  });

  test('loading actions are not interactive', () {
    const action = ActionPresentation(
      label: 'Save',
      semanticLabel: 'Save',
      state: ActionState.loading,
    );
    expect(action.canActivate, isFalse);
  });
}
