import 'package:ai_character_chat_mobile/presentation/explore/bloc/explore_cubit.dart';
import 'package:ai_character_chat_mobile/presentation/widgets/models/presentation_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('presenter policy never falls back to fixtures in production', () async {
    final cubit = ExploreCubit(usesFixtures: false);
    addTearDown(cubit.close);
    expect(cubit.state, isA<ContentEmpty<Object?>>());
  });
  test('preview presenter emits display-ready content', () async {
    final cubit = ExploreCubit(usesFixtures: true);
    addTearDown(cubit.close);
    expect(cubit.state, isA<ContentReady<Object?>>());
  });
}
