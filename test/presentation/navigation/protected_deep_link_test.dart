import 'package:ai_character_chat_mobile/router/intended_destination_policy.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('safe intended destination is consumed once', () {
    final policy = IntendedDestinationPolicy()..retain('/conversations/an');
    expect(policy.consume(), '/conversations/an');
    expect(policy.consume(), isNull);
  });
  test('external and unknown destinations are rejected', () {
    final policy = IntendedDestinationPolicy()..retain('https://example.com');
    expect(policy.consume(), isNull);
  });
}
