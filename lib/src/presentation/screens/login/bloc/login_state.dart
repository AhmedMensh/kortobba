part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  final String? error;
  const LoginState({this.error});
  @override
  List<Object?> get props => [error];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}


class LoginLoading extends LoginState {
  const LoginLoading();
}


class LoginError extends LoginState {
  const LoginError(String error) :super(error: error);
}


class LoginSuccess extends LoginState {
  const LoginSuccess();
}

