import 'package:dio/dio.dart';
import 'package:sim/api/dio.dart';
import 'package:sim/data/endpoints/users.dart';

class UsersApi {
  loadUsers() async {
    return callApi.get(
      UserConfig.list,
      queryParameters: {
        "page": 2,
      },
    );
  }
}
