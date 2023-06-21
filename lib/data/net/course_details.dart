import 'package:dio/dio.dart';
import 'package:sim/data/models/course_details.dart';

import '../../api/dio.dart';
import '../endpoints/course.dart';
import '../models/api_response.dart';

class CourseService {
  static Future<ApiResponse<CourseDetails>> loadCourseDetails(
    String courseCode,
  ) async {
    try {
      final res = await CallApi.get('${CourseConfig.details}/$courseCode');

      if (res.statusCode == 200) {
        return ApiResponse<CourseDetails>.success(
          res,
          CourseDetails.fromJson(res.data["data"]),
        );
      }

      return ApiResponse.error(res);
    } on DioError catch (e) {
      return ApiResponse.error(e.response);
    }
  }
}
