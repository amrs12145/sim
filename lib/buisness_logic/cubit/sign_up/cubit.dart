import 'package:bloc/bloc.dart';

import '../../../data/net/users.dart';
part 'states.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpStateIntial());

  late String _username;
  late String _studentMail;
  late String _phoneNumber;
  late String _studendId;
  late String _password;
  late String _password2;

  usernameOnChanged(p0) => _username = p0;
  studentMailOnChanged(p0) => _studentMail = p0;
  phoneNumberOnChanged(p0) => _phoneNumber = p0;
  studentIdOnChanged(p0) => _studendId = p0;
  passwordOnChanged(p0) => _password = p0;
  password2OnChanged(p0) => _password2 = p0;

  void signUp() async {
    if (_password != _password2) {
      print('Unmatched Passwords');
      return;
    }

    emit(SignUpStateLoading());

    final res = await LoginService.signUp(
      _username,
      _studentMail,
      _phoneNumber,
      _studendId,
      _password,
      _password2,
    );

    if (res.isSuccess) {
      emit(SignUpStateSuccess());
    } else {
      emit(SignUpStateFailed(res.errorsMap.toString()));
    }
  }
}
