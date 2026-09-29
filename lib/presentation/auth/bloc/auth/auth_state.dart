part of 'auth_bloc.dart';

enum AuthenticationStatus {
  startup,
  authenticating,
  authenticated,
  unauthenticated,
  sessionExpired,
}

class AuthState extends Equatable {
  const AuthState._({this.status = AuthenticationStatus.startup, this.user});

  const AuthState.startup() : this._();

  const AuthState.authenticating()
    : this._(status: AuthenticationStatus.authenticating);

  const AuthState.authenticated(UserModel user)
    : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthState.unauthenticated()
    : this._(status: AuthenticationStatus.unauthenticated);

  const AuthState.sessionExpired()
    : this._(status: AuthenticationStatus.sessionExpired);

  final AuthenticationStatus status;
  final UserModel? user;

  @override
  List<Object?> get props => [status, user];
}
