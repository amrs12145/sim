import 'package:dio/dio.dart';

import '../../api/dio.dart';
import '../endpoints/general.dart';
import '../models/api_response.dart';
import '../models/staff.dart';

class StaffService {
  static Future<ApiResponse<Staff>> loadCourseDetails(
    String email,
  ) async {
    try {
      final res = await CallApi.get('${GeneralConfig.staffAttached}/$email');

      if (res.statusCode == 200) {
        return ApiResponse<Staff>.success(
          res,
          Staff.fromJson(res.data["data"]),
        );
      }

      return ApiResponse.error(res);
    } on DioException catch (e) {
      return ApiResponse.error(e.response);
    }
  }
}
