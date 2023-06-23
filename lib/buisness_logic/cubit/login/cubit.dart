import 'package:bloc/bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/dio.dart';
import '../../../core/token.dart';
import '../../../data/net/users.dart';
import '../../../data/models/user.dart';
part 'states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginStateIntial());

  late String _studentMail;
  late String _password;

  studentMailOnChanged(p0) => _studentMail = p0;
  passwordOnChanged(p0) => _password = p0;

  void login() async {
    emit(LoginStateLoading());

    final res = await LoginService.login(_studentMail, _password);

    if (res.isSuccess) {
      emit(LoginStateSuccess(res.dataModel!));
      saveToken(res.dataModel!.token);
    } else {
      emit(LoginStateFailed(res.message));
    }
  }

  saveToken(String token) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    TOKEN = token;

    // prefs.setString('token', token);
    CallApi.setToken();
  }
}
