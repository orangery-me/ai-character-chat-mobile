import 'package:flutter/foundation.dart';

@immutable
class RouteValue {
  const RouteValue._(this.value);
  final String value;
  static RouteValue? tryParse(String? raw) {
    if (raw == null) return null;
    try {
      final decoded = Uri.decodeComponent(raw).trim();
      if (decoded.isEmpty || decoded.contains('/') || decoded.contains('..')) {
        return null;
      }
      return RouteValue._(decoded);
    } on FormatException {
      return null;
    }
  }

  @override
  bool operator ==(Object other) => other is RouteValue && other.value == value;
  @override
  int get hashCode => value.hashCode;
}
