import 'package:dio/dio.dart';

class DioHelper {
  static const String baseUrl = "https://thimar.amr.aait-d.com/api/";

  static final _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        "Accept": "application/json",
      },
    ),
  );

  static Future<CustomResponse> send(String path,
      {Map<String, dynamic>? data}) async {
    print("(POST) ${baseUrl}$path");

    try {
      final response = await _dio.post(path, data: data);
      print(response.data);
      return CustomResponse(
        isSuccess: true,
        data: response.data,
        msg: response.data["message"],
      );
    } on DioException catch (ex) {
      return _handleException(ex);
    }
  }

  static CustomResponse _handleException(DioException ex) {
    print(ex.error);
    print(ex.response?.data);
    print(ex.message);
    print(ex.type);
    print(ex.stackTrace);
    return CustomResponse(
      isSuccess: false,
      msg: ex.response?.data["message"],
    );
  }

  static Future<CustomResponse> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    print("(GET) ${baseUrl}$path");

    final response = await _dio.get(path);
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      print(response.data);
      return CustomResponse(
        isSuccess: true,
        data: response.data,
        msg: response.data["message"],
      );
    } on DioException catch (ex) {
      return _handleException(ex);
    }
  }
}

class CustomResponse {
  final bool isSuccess;
  final data;
  final String? msg;

  CustomResponse({required this.isSuccess, this.data, this.msg});
}
