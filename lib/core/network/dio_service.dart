import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/configs/config.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/interceptors/error_interceptor.dart';
import 'package:medglobal_admin_portal/core/network/models/api_response.dart';

class DioService {
  late Dio _dio;

  DioService() {
    _dio = create();
  }

  BaseOptions _createBaseOptions() => BaseOptions(
        baseUrl: Config.baseUrl,
        headers: {'content-type': 'application/json'},
        responseType: ResponseType.json,
        validateStatus: (status) => true,
        receiveTimeout: const Duration(seconds: 5),
        // sendTimeout: const Duration(seconds: 5),
        connectTimeout: const Duration(seconds: 5),
      );

  Dio create() => Dio(_createBaseOptions())
    ..interceptors.addAll([
      ErrorInterceptor(),
    ]);

  Future<ApiResponse<R>> get<R>(String endpoint, {JSON? queryParams}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParams);
      return ApiResponse.fromJson(response.data!);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<R>> post<R>(String endpoint, {JSON? data}) async {
    final response = await _dio.post(endpoint, data: data);
    return ApiResponse.fromJson(response.data);
  }

  Future<ApiResponse<R>> put<R>(String endpoint, {JSON? data}) async {
    final response = await _dio.put(endpoint, data: data);
    return ApiResponse<R>.fromJson(response.data);
  }

  Future<ApiResponse<R>> delete<R>(String endpoint, {JSON? data}) async {
    final response = await _dio.delete(endpoint, data: data);
    return ApiResponse<R>.fromJson(response.data);
  }
}
