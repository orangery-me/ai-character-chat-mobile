import 'dart:convert';

import 'package:ai_character_chat_mobile/common/constants/hive_keys.dart';
import 'package:ai_character_chat_mobile/data/models/user_model.dart';
import 'package:hive/hive.dart';

class UserLocalDataSource {
  UserLocalDataSource({required Box<dynamic> authBox}) : _authBox = authBox;

  final Box<dynamic> _authBox;

  UserModel? getUserInfo() {
    final rawData = _authBox.get(HiveKeys.user) as String?;

    if (rawData == null) {
      return null;
    } else {
      return UserModel.fromJson(
        Map<String, dynamic>.from(jsonDecode(rawData) as Map<String, dynamic>),
      );
    }
  }

  Future<void> setUserInfo(UserModel user) async {
    await _authBox.put(HiveKeys.user, jsonEncode(user.toJson()));
  }

  Future<void> clearUserInfo() => _authBox.delete(HiveKeys.user);
}
