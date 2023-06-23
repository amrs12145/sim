import 'package:dio/dio.dart';

class ApiResponse<T> {
  bool isSuccess;
  T? dataModel;
  int? statusCode;
  String? statusMessage;
  String? message;
  dynamic errorsMap;
  RequestOptions? requestOptions;

  ApiResponse({
    required this.isSuccess,
    required this.dataModel,
    required this.statusCode,
    required this.statusMessage,
    required this.message,
    required this.errorsMap,
    required this.requestOptions,
  });

  factory ApiResponse.success(
    Response response,
    T dataModel, [
    String? message,
  ]) =>
      ApiResponse(
        isSuccess: true,
        dataModel: dataModel,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        requestOptions: response.requestOptions,
        message: message ?? response.data['message'],
        errorsMap: null,
      );

  factory ApiResponse.error(Response? response, [String? message]) =>
      ApiResponse(
        isSuccess: false,
        dataModel: null,
        statusCode: response?.statusCode,
        statusMessage: response?.statusMessage,
        requestOptions: response?.requestOptions,
        message: message ?? response?.data['message'],
        errorsMap: response?.data['errors'],
      );
}
