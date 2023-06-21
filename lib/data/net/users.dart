import 'package:dio/dio.dart';
import '../../api/dio.dart';
import '../endpoints/users.dart';
import '../models/user.dart';
import '../models/api_response.dart';

class LoginService {
  static Future<ApiResponse<UserUI?>> login<T>(
    String email,
    String password,
  ) async {
    try {
      final res = await CallApi.post(
        UserConfig.login,
        data: FormData.fromMap(
          {
            "email": email,
            "password": password,
          },
        ),
      );
      // Successful Login Response Sample
      // {
      //   "message": "Successfuly login ",
      //   "token": "135|szOhQO8xIa7Aje08D5iZ7y6L9pV72gJKIEsmtR5Y"
      // }

      if (res.data['token'] != null) {
        return ApiResponse<UserUI>.success(
          res,
          UserUI(
            name: "Amr",
            email: email,
            token: res.data['token'].toString().split('|')[1],
          ),
        );
      }

      return ApiResponse.error(res);
    } on DioError catch (e) {
      return ApiResponse.error(e.response);
    }
  }

  static Future<ApiResponse<bool?>> signUp<T>(
    String name,
    String email,
    String phoneNumber,
    String studentId,
    String password,
    String password2,
  ) async {
    try {
      final res = await CallApi.post(
        UserConfig.signUp,
        data: FormData.fromMap(
          {
            "name": name,
            "email": email,
            "password": password,
            "password_confirm": password2,
            "phone_number": phoneNumber,
            "collage_id": studentId,
            "gender": "male",
          },
        ),
      );

      // {
      //   "messsage": "successful registeration",
      //   "data": [],
      //   "status": 200
      // }

      if (res.data['errors'] == null) {
        return ApiResponse.success(res, true);
      }
      return ApiResponse.error(res);
    } on DioError catch (e) {
      return ApiResponse.error(e.response);
    }
  }

  static Future<ApiResponse<bool>> logOut<T>() async {
    try {
      final res = await CallApi.post(
        UserConfig.logOut,
      );

      if (res.statusCode == 200) {
        return ApiResponse.success(
          res,
          true,
        );
      }

      return ApiResponse.error(res);
    } on DioError catch (e) {
      return ApiResponse.error(e.response);
    }
  }
}
