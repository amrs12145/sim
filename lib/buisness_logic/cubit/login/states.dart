part of 'cubit.dart';

abstract class LoginState {}

class LoginStateIntial extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends LoginState {
  final UserUI userUI;
  LoginStateSuccess(this.userUI);
}

class LoginStateFailed extends LoginState {
  final String? message;
  LoginStateFailed(this.message);
}
