class ApiProblem {
  const ApiProblem({
    required this.status,
    required this.code,
    required this.detail,
    required this.requestId,
  });

  factory ApiProblem.fromJson(Object? source) {
    if (source is! Map<String, dynamic>) {
      throw const FormatException('Problem response must be a JSON object.');
    }
    final status = source['status'];
    final code = source['code'];
    final detail = source['detail'];
    final requestId = source['requestId'];
    if (status is! int ||
        code is! String ||
        detail is! String ||
        requestId is! String) {
      throw const FormatException('Problem response has an invalid shape.');
    }
    return ApiProblem(
      status: status,
      code: code,
      detail: detail,
      requestId: requestId,
    );
  }

  final int status;
  final String code;
  final String detail;
  final String requestId;
}

class ApiProblemException implements Exception {
  const ApiProblemException(this.problem);

  final ApiProblem problem;
}

class SessionExpiredException implements Exception {
  const SessionExpiredException();
}
