import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';

class DioServiceNew {
  final Dio _dio;

  DioServiceNew._internal()
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
  static final DioServiceNew _instance = DioServiceNew._internal();

  // Factory constructor for getting the singleton instance
  factory DioServiceNew() => _instance;

  Dio get dio => _dio;
}
