import 'package:dio/dio.dart';
import 'package:sim/data/endpoints/home.dart';
import 'package:sim/data/models/course.dart';
import 'package:sim/data/models/field.dart';
import '../../api/dio.dart';
import '../models/api_response.dart';

class HomeService {
  static Future<ApiResponse<List<Field>>> loadFields() async {
    try {
      final res = await CallApi.get(HomeConfig.fields);

      if (res.statusCode == 200) {
        return ApiResponse<List<Field>>.success(
          res,
          Field.fromJsonList(res.data["data"]),
        );
      }

      return ApiResponse.error(res);
    } on DioException catch (e) {
      return ApiResponse.error(e.response);
    }
  }

  static Future<ApiResponse<List<Course>>> loadCourses() async {
    try {
      final res = await CallApi.get(HomeConfig.courses);

      if (res.statusCode == 200) {
        return ApiResponse<List<Course>>.success(
          res,
          Course.fromJsonList(res.data["data"]),
        );
      }

      return ApiResponse.error(res);
    } on DioException catch (e) {
      return ApiResponse.error(e.response);
    }
  }

  static Future<ApiResponse<List<Course>>> loadAvailableCourses() async {
    try {
      final res = await CallApi.get(HomeConfig.availableCourses);

      if (res.statusCode == 200) {
        return ApiResponse<List<Course>>.success(
          res,
          Course.fromJsonList(res.data["data"]),
        );
      }

      return ApiResponse.error(res);
    } on DioException catch (e) {
      return ApiResponse.error(e.response);
    }
  }

  static Future<ApiResponse<List<Course>>> loadFieldCourses(
    String fieldName,
  ) async {
    try {
      final res = await CallApi.get('${HomeConfig.fieldCourses}/$fieldName');

      if (res.statusCode == 200) {
        return ApiResponse<List<Course>>.success(
          res,
          Course.fromJsonList(res.data["data"]),
        );
      }

      return ApiResponse.error(res);
    } on DioException catch (e) {
      return ApiResponse.error(e.response);
    }
  }

  // static Future<ApiResponse<bool?>> signUp<T>(
  //   String name,
  //   String email,
  //   String phoneNumber,
  //   String studentId,
  //   String password,
  //   String password2,
  // ) async {
  //   try {
  //     final res = await CallApi.post(
  //       UserConfig.signUp,
  //       data: FormData.fromMap(
  //         {
  //           "name": name,
  //           "email": email,
  //           "password": password,
  //           "password_confirm": password2,
  //           "phone_number": phoneNumber,
  //           "collage_id": studentId,
  //           "gender": "male",
  //         },
  //       ),
  //     );

  //     // {
  //     //   "messsage": "successful registeration",
  //     //   "data": [],
  //     //   "status": 200
  //     // }

  //     if (res.data['errors'] == null) {
  //       return ApiResponse.success(res, true);
  //     }
  //     return ApiResponse.error(res);
  //   } on DioError catch (e) {
  //     return ApiResponse.error(e.response);
  //   }
  // }

  // static Future<ApiResponse<bool>> logOut<T>() async {
  //   try {
  //     final res = await CallApi.post(
  //       UserConfig.logOut,
  //     );

  //     if (res.statusCode == 200) {
  //       return ApiResponse.success(
  //         res,
  //         true,
  //       );
  //     }

  //     return ApiResponse.error(res);
  //   } on DioError catch (e) {
  //     return ApiResponse.error(e.response);
  //   }
  // }
}
