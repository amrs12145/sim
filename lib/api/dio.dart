import 'package:dio/dio.dart';

import 'config.dart';
import 'interceptor.dart';

class callApi {
  static Dio dio = _initialize()
    ..interceptors.add(
      AppInterceptors(),
    );

  static const String _baseUrl = BASE_URL;
  static const Map<String, dynamic> _headers = {
    Headers.acceptHeader: 'application/json',
    Headers.contentTypeHeader: 'application/json; charset=utf-8',
    // 'Authorization': 'Bearer', //To be added when logging
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
    return dio.post(path);
  }
}
