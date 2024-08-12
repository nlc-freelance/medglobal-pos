import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/portal/authentication/data/api/auth_service.dart';
import '../api_endpoint.dart';

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final path = options.path;
    String baseUrl = ApiEndpoint.baseUrl(path);
    options.baseUrl = baseUrl;

    String token = await AuthService().getToken();
    int? userId = await AuthService().getUserId();
    options.headers['Authorization'] = 'Bearer $token';
    options.headers['userId'] = userId;

    print('Bearer $token');

    super.onRequest(options, handler);
  }
}
