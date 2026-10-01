import 'package:ai_character_chat_mobile/router/route_value.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('opaque route values reject blank and structural input', () {
    expect(RouteValue.tryParse('character-1')?.value, 'character-1');
    expect(RouteValue.tryParse('   '), isNull);
    expect(RouteValue.tryParse('../admin'), isNull);
    expect(RouteValue.tryParse('a%2Fb'), isNull);
  });
}
