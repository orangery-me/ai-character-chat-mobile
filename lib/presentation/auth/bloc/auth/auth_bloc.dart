import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ai_character_chat_mobile/data/dtos/api/api_problem.dart';
import 'package:ai_character_chat_mobile/data/models/user_model.dart';
import 'package:ai_character_chat_mobile/data/repositories/session_repository.dart';
import 'package:ai_character_chat_mobile/data/repositories/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required UserRepository userRepository})
    : _userRepository = userRepository,
      super(const AuthState.startup()) {
    on<AuthUserInfoSet>(_onSetUserInfo);
    on<AuthUserInfoCheck>(_onCheckUserInfo);
    on<AuthLogoutRequested>(_onLogout);
    on<AuthSessionExpired>(
      (event, emit) => emit(const AuthState.sessionExpired()),
    );
    _statusSubscription = _userRepository.statusChanges.listen((status) {
      if (status == SessionStatus.sessionExpired) add(AuthSessionExpired());
    });
  }
  final UserRepository _userRepository;
  late final StreamSubscription<SessionStatus> _statusSubscription;

  Future<void> _onCheckUserInfo(
    AuthUserInfoCheck event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.authenticating());
    try {
      final user = await _userRepository.hydrate();

      _changeAuthState(user, emit);
    } on SessionExpiredException {
      emit(const AuthState.sessionExpired());
    }
  }

  Future<void> _onLogout(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await _userRepository.logout();
    emit(const AuthState.unauthenticated());
  }

  void _onSetUserInfo(AuthUserInfoSet event, Emitter<AuthState> emit) {
    _changeAuthState(event.currentUser, emit);
  }

  void _changeAuthState(UserModel? user, Emitter<AuthState> emit) {
    if (user == null) {
      emit(const AuthState.unauthenticated());
    } else {
      emit(AuthState.authenticated(user));
    }
  }

  @override
  Future<void> close() async {
    await _statusSubscription.cancel();
    return super.close();
  }
}
