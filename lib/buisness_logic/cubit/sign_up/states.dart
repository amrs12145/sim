part of 'cubit.dart';

abstract class SignUpState {}

class SignUpStateIntial extends SignUpState {}

class SignUpStateLoading extends SignUpState {}

class SignUpStateSuccess extends SignUpState {
  SignUpStateSuccess();
}

class SignUpStateFailed extends SignUpState {
  final String? message;
  SignUpStateFailed(this.message);
}
