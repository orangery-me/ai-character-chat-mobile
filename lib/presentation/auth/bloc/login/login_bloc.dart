import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:ai_character_chat_mobile/data/dtos/api/api_problem.dart';
import 'package:ai_character_chat_mobile/data/dtos/auth/login_by_email_request_dto.dart';
import 'package:ai_character_chat_mobile/data/repositories/user_repository.dart';
import 'package:ai_character_chat_mobile/generated/locale_keys.g.dart';
import 'package:ai_character_chat_mobile/presentation/auth/bloc/auth/auth_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required UserRepository userRepository,
    required AuthBloc authBloc,
  }) : _authBloc = authBloc,
       _userRepository = userRepository,
       super(LoginInitial()) {
    on<LoginSubmit>(_onLoginSubmit);
  }

  final AuthBloc _authBloc;
  final UserRepository _userRepository;

  Future<void> _onLoginSubmit(
    LoginSubmit event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
      final user = await _userRepository.loginByEmail(
        LoginByEmailRequestDTO(email: event.email, password: event.password),
      );

      _authBloc.add(AuthUserInfoSet(currentUser: user));
    } on ApiProblemException catch (error) {
      emit(
        LoginNotSuccess(
          error: error.problem.status == 401
              ? LocaleKeys.validator_incorrect_email_password.tr()
              : error.problem.detail,
        ),
      );
    } on DioException {
      emit(LoginNotSuccess(error: null));
    } on FormatException {
      emit(LoginNotSuccess(error: null));
    }
  }
}
