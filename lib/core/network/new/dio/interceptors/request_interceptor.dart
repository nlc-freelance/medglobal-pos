import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/network/api_endpoint.dart';
import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
import 'package:medglobal_admin_portal/portal/authentication/data/api/auth_service.dart';

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final path = options.path;
    String baseUrl = ApiEndpoint.baseUrl(path);
    options.baseUrl = baseUrl;

    String token = await AuthService().getToken();
    int? userId = await SharedPreferencesService.getUserId();

    options.headers['Authorization'] = 'Bearer $token';
    options.headers['userId'] = userId;

    debugPrint('Request: ${options.method} ${options.uri}');
    if (options.data != null) debugPrint('Payload: ${options.method} ${options.data}');

    super.onRequest(options, handler);
  }
}
