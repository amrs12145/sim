import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../core/token.dart';
import 'config.dart';
import 'interceptor.dart';

class CallApi {
  static Dio dio = _initialize()
    ..interceptors.add(
      AppInterceptors(),
    );

  static Future<void> setToken() async {
    // final prefs = await SharedPreferences.getInstance();

    // final token = prefs.getString('token') ?? '';

    dio.options.headers.addAll({
      'Authorization': 'Bearer $TOKEN',
    });
  }

  static const String _baseUrl = BASE_URL;
  static const Map<String, dynamic> _headers = {
    Headers.acceptHeader: 'application/json',
    // Headers.contentTypeHeader: 'application/json; charset=utf-8',
  };

  static Dio _initialize() {
    return Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        headers: _headers,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 5),
      ),
    );
  }

  static Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  static Future<Response<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}
