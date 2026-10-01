class IntendedDestinationPolicy {
  String? _pending;
  static final RegExp _safePath = RegExp(
    r'^/(explore|messages|novels|profile|characters/(create|[^/]+)|conversations/[^/]+|novels/[^/]+/chapters/[^/]+)$',
  );
  void retain(String location) {
    if (_safePath.hasMatch(location)) _pending = location;
  }

  String? consume() {
    final value = _pending;
    _pending = null;
    return value;
  }
}
