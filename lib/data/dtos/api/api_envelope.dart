class ApiEnvelope<T> {
  const ApiEnvelope({required this.data, required this.requestId});

  factory ApiEnvelope.fromJson(
    Object? source,
    T Function(Map<String, dynamic> json) decodeData,
  ) {
    if (source is! Map<String, dynamic>) {
      throw const FormatException('API response must be a JSON object.');
    }
    final data = source['data'];
    final requestId = source['requestId'];
    if (data is! Map<String, dynamic> ||
        requestId is! String ||
        requestId.isEmpty) {
      throw const FormatException(
        'API response envelope has an invalid shape.',
      );
    }
    return ApiEnvelope<T>(data: decodeData(data), requestId: requestId);
  }

  final T data;
  final String requestId;
}
