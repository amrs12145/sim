import 'package:dio/dio.dart';
import 'package:sim/data/endpoints/general.dart';
import 'package:sim/data/models/student_info.dart';

import '../../api/dio.dart';
import '../models/api_response.dart';
import '../models/course.dart';
import '../models/field.dart';

class ProfileService {
  static Future<ApiResponse<List<Course>>> loadRegisteredCourses() async {
    try {
      final res = await CallApi.get(GeneralConfig.registeredCourses);

      if (res.statusCode == 200) {
        return ApiResponse.success(
          res,
          Course.fromJsonList(res.data["data"]),
        );
      }

      return ApiResponse.error(res);
    } on DioException catch (e) {
      return ApiResponse.error(e.response);
    }
  }

  static Future<ApiResponse<StudentInfo>> loadStudentInfo() async {
    try {
      final res = await CallApi.get(GeneralConfig.studnetInfo);

      if (res.statusCode == 200) {
        return ApiResponse.success(
          res,
          StudentInfo.fromJson(res.data["data"]),
        );
      }

      return ApiResponse.error(res);
    } on DioException catch (e) {
      return ApiResponse.error(e.response);
    }
  }

  static Future<ApiResponse<bool>> addField(
    String fieldName,
    double score,
  ) async {
    try {
      final res = await CallApi.post(
        GeneralConfig.addField,
        data: {
          "field_name": fieldName,
          "score": score,
        },
      );

      if (res.statusCode == 200) {
        return ApiResponse.success(
          res,
          true,
        );
      }

      return ApiResponse.error(res);
    } on DioException catch (e) {
      return ApiResponse.error(e.response);
    }
  }

  static Future<ApiResponse<bool>> removeField(String name) async {
    try {
      final res = await CallApi.get('${GeneralConfig.removeField}/$name');

      if (res.statusCode == 200) {
        return ApiResponse.success(
          res,
          true,
        );
      }

      return ApiResponse.error(res);
    } on DioException catch (e) {
      return ApiResponse.error(e.response);
    }
  }

  static Future<ApiResponse<List<Field>>> showStudentFields() async {
    try {
      final res = await CallApi.get(GeneralConfig.showStudentFields);

      if (res.statusCode == 200) {
        return ApiResponse.success(
          res,
          Field.fromJsonList(res.data["data"]),
        );
      }

      return ApiResponse.error(res);
    } on DioException catch (e) {
      return ApiResponse.error(e.response);
    }
  }
}
