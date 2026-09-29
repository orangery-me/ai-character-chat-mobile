class UserModel {
  const UserModel({
    required this.id,
    required this.email,
    required this.displayName,
    required this.bio,
    required this.dateOfBirth,
    required this.role,
    required this.status,
    required this.version,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: _requiredString(json, 'id'),
      email: _requiredString(json, 'email'),
      displayName: _requiredString(json, 'displayName'),
      bio: _nullableString(json, 'bio'),
      dateOfBirth: _nullableString(json, 'dateOfBirth'),
      role: _requiredString(json, 'role'),
      status: _requiredString(json, 'status'),
      version: _requiredInt(json, 'version'),
      createdAt: _requiredDate(json, 'createdAt'),
      updatedAt: _requiredDate(json, 'updatedAt'),
    );
  }

  final String id;
  final String email;
  final String displayName;
  final String? bio;
  final String? dateOfBirth;
  final String role;
  final String status;
  final int version;
  final DateTime createdAt;
  final DateTime updatedAt;

  String get firstName => displayName;
  String get lastName => '';

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'email': email,
    'displayName': displayName,
    'bio': bio,
    'dateOfBirth': dateOfBirth,
    'role': role,
    'status': status,
    'version': version,
    'createdAt': createdAt.toUtc().toIso8601String(),
    'updatedAt': updatedAt.toUtc().toIso8601String(),
  };

  static String _requiredString(Map<String, dynamic> json, String key) {
    final value = json[key];
    if (value is! String || value.isEmpty) {
      throw FormatException('$key must be a non-empty string.');
    }
    return value;
  }

  static String? _nullableString(Map<String, dynamic> json, String key) {
    final value = json[key];
    if (value == null) {
      return null;
    }
    if (value is! String) {
      throw FormatException('$key must be a string or null.');
    }
    return value;
  }

  static int _requiredInt(Map<String, dynamic> json, String key) {
    final value = json[key];
    if (value is! int) {
      throw FormatException('$key must be an integer.');
    }
    return value;
  }

  static DateTime _requiredDate(Map<String, dynamic> json, String key) {
    final value = _requiredString(json, key);
    final parsed = DateTime.tryParse(value);
    if (parsed == null) {
      throw FormatException('$key must be an RFC 3339 timestamp.');
    }
    return parsed;
  }
}
