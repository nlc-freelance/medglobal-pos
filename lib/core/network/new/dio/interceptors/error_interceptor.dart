import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final status = response.statusCode;
    final isValid = status != null && status >= 200 && status < 300;

    if (!isValid) {
      handler.reject(
        DioException.badResponse(
          statusCode: status!,
          requestOptions: response.requestOptions,
          response: response,
        ),
        true, // pass `true` to indicate the error is unrecoverable (fatal)
      );
      return; // prevent calling `super.onResponse`
    }

    super.onResponse(response, handler); // continue if valid
  }
}
