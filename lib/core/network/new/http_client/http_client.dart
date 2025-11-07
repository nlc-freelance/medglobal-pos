import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';

class HttpClient {
  final Dio _dio;

  HttpClient._internal()
      : _dio = Dio(
          BaseOptions(
            headers: {'content-type': 'application/json'},
            responseType: ResponseType.json,
            validateStatus: (status) => true,
            connectTimeout: const Duration(seconds: 100),
            receiveTimeout: const Duration(seconds: 100),
          ),
        ) {
    _dio.interceptors.addAll([
      RequestInterceptor(),
      ErrorInterceptor(),
    ]);
  }

  // Singleton instance
  static final HttpClient _instance = HttpClient._internal();

  // Factory constructor for getting the singleton instance
  factory HttpClient() => _instance;

  Dio get dio => _dio;
}
