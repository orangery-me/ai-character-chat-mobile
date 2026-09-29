import 'package:ai_character_chat_mobile/data/datasources/user/local/user_datasource.dart';
import 'package:ai_character_chat_mobile/data/dtos/auth/login_by_email_request_dto.dart';
import 'package:ai_character_chat_mobile/data/models/user_model.dart';
import 'package:ai_character_chat_mobile/data/repositories/session_repository.dart';

class UserRepository {
  UserRepository({
    required SessionRepository sessionRepository,
    required UserLocalDataSource localDataSource,
  }) : _sessionRepository = sessionRepository,
       _localDataSource = localDataSource;

  final SessionRepository _sessionRepository;
  final UserLocalDataSource _localDataSource;

  Stream<SessionStatus> get statusChanges => _sessionRepository.statusChanges;

  Future<UserModel> loginByEmail(LoginByEmailRequestDTO params) async {
    final user = await _sessionRepository.login(params);
    await _localDataSource.setUserInfo(user);
    return user;
  }

  Future<UserModel?> hydrate() async {
    final user = await _sessionRepository.hydrate();
    if (user == null) {
      await _localDataSource.clearUserInfo();
    } else {
      await _localDataSource.setUserInfo(user);
    }
    return user;
  }

  UserModel? getUserInfo() =>
      _sessionRepository.currentUser ?? _localDataSource.getUserInfo();

  Future<void> logout() async {
    await _sessionRepository.logout();
    await _localDataSource.clearUserInfo();
  }
}
