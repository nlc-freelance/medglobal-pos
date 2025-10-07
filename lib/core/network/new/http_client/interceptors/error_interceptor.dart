import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// class ErrorInterceptor extends Interceptor {
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     final status = response.statusCode;
//     final isValid = status != null && status >= 200 && status < 300;
//
//     if (!isValid) {
//       handler.reject(
//         DioException.badResponse(
//           statusCode: status!,
//           requestOptions: response.requestOptions,
//           response: response,
//         ),
//         true, // pass `true` to indicate the error is unrecoverable (fatal)
//       );
//       return; // prevent calling `super.onResponse`
//     }
//
//     super.onResponse(response, handler); // continue if valid
//   }
// }

class ErrorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('Response: ${response.requestOptions.method} ${response.statusCode} ${response.data}');

    // Just pass the response through, no manual rejection here
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('Error: ${err.requestOptions.method} ${err.message}');

    // Let all errors (timeouts, cancellations, badResponse, etc.) flow naturally
    handler.next(err);
  }
}
