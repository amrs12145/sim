import 'package:dio/dio.dart';
import 'package:sim/data/models/course_details.dart';

import '../../api/dio.dart';
import '../endpoints/general.dart';
import '../models/api_response.dart';

class CourseService {
  static Future<ApiResponse<CourseDetails>> loadCourseDetails(
    String courseCode,
  ) async {
    try {
      final res = await CallApi.get('${GeneralConfig.details}/$courseCode');

      if (res.statusCode == 200) {
        return ApiResponse<CourseDetails>.success(
          res,
          CourseDetails.fromJson(res.data["data"]),
        );
      }

      return ApiResponse.error(res);
    } on DioException catch (e) {
      return ApiResponse.error(e.response);
    }
  }

  static Future<ApiResponse<bool>> registerCourse(
    int courseCode,
    int semester,
  ) async {
    try {
      final res = await CallApi.post(
        GeneralConfig.registerCourse,
        data: FormData.fromMap(
          {
            "course_code": courseCode,
            "term": semester,
          },
        ),
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

  static Future<ApiResponse<bool>> attachCourse(
    int courseCode,
    String email,
  ) async {
    try {
      final res = await CallApi.post(
        GeneralConfig.attachCourse,
        data: FormData.fromMap(
          {
            "course_code": courseCode,
            "email": email,
          },
        ),
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

  static Future<ApiResponse<bool>> toggleCourseStatus(
    int courseCode,
  ) async {
    try {
      final res = await CallApi.get(
        '${GeneralConfig.toggleCourseStatus}/$courseCode',
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
}
