import 'package:dio/dio.dart';
import 'package:sim/data/endpoints/general.dart';
import 'package:sim/data/models/course.dart';
import 'package:sim/data/models/field.dart';
import 'package:sim/data/models/staff.dart';
import 'package:sim/data/net/home.dart';
import '../../api/dio.dart';
import '../models/api_response.dart';

class AdminService {
  static Future<ApiResponse<List<Staff>>> loadProfessors() async {
    try {
      final res = await CallApi.get(GeneralConfig.staff);

      if (res.statusCode == 200) {
        return ApiResponse<List<Staff>>.success(
          res,
          Staff.fromJsonList(res.data["data"]),
        );
      }

      return ApiResponse.error(res);
    } on DioException catch (e) {
      return ApiResponse.error(e.response);
    }
  }

  static Future<ApiResponse<List<Field>>> loadFields() async {
    return HomeService.loadFields();
  }

  static Future<ApiResponse<List<Course>>> loadCourses() async {
    return HomeService.loadCourses();
  }
}
