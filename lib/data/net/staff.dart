import 'package:dio/dio.dart';

import '../../api/dio.dart';
import '../endpoints/course.dart';
import '../endpoints/staff.dart';
import '../models/api_response.dart';
import '../models/course.dart';
import '../models/staff.dart';

class StaffService {
  static Future<ApiResponse<Staff>> loadCourseDetails(
    String email,
  ) async {
    try {
      final res = await CallApi.get('${StaffConfig.attached}/$email');

      if (res.statusCode == 200) {
        return ApiResponse<Staff>.success(
          res,
          Staff.fromJson(res.data["data"]),
        );
      }

      return ApiResponse.error(res);
    } on DioError catch (e) {
      return ApiResponse.error(e.response);
    }
  }
}
