import 'package:dio/dio.dart';

import '../../api/dio.dart';
import '../endpoints/course.dart';
import '../models/api_response.dart';
import '../models/course.dart';

class ProfileService {
  static Future<ApiResponse<List<Course>>> loadRegisteredCourses() async {
    try {
      final res = await CallApi.get(CourseConfig.registeredCourses);

      if (res.statusCode == 200) {
        return ApiResponse.success(
          res,
          Course.fromJsonList(res.data["data"]),
        );
      }

      return ApiResponse.error(res);
    } on DioError catch (e) {
      return ApiResponse.error(e.response);
    }
  }
}
