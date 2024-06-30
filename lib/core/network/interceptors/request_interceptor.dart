import 'package:dio/dio.dart';
import '../api_endpoint.dart';

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final path = options.path;
    String baseUrl = ApiEndpoint.baseUrl(path);
    options.baseUrl = baseUrl;

    super.onRequest(options, handler);
  }
}
