import 'dart:io';

import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/network/new/api/api_result.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';

class ApiService {
  final HttpClient client;

  ApiService(this.client);

  /// GET request for single object
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParams,
    required JsonParser<T> parser,
  }) async {
    try {
      final response = await client.dio.get(path, queryParameters: queryParams);
      return _parseResponse<T>(
        response: response,
        parser: parser,
        format: ResponseFormat.single,
      );
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  /// GET request for list data
  Future<List<T>> getList<T>(
    String path, {
    Map<String, dynamic>? queryParams,
    required JsonParser<T> parser,
  }) async {
    try {
      final response = await client.dio.get(path, queryParameters: queryParams);
      return _parseResponse<List<T>>(
        response: response,
        parser: (list) => list.map<T>((item) => parser(item)).toList(),
        format: ResponseFormat.list,
      );
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  /// GET request for paginated list
  Future<Paginated<T>> getPaginated<T>(
    String path, {
    Map<String, dynamic>? queryParams,
    required JsonParser<T> parser,
  }) async {
    try {
      final response = await client.dio.get(path, queryParameters: queryParams);
      return _parseResponse<Paginated<T>>(
        response: response,
        parser: (json) => Paginated<T>.fromJson(json, parser),
        format: ResponseFormat.paginated,
      );
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  /// POST request
  Future<T> post<T>(
    String path, {
    required Map<String, dynamic> data,
    required JsonParser<T> parser,
  }) async {
    try {
      final response = await client.dio.post(path, data: data);
      return _parseResponse<T>(
        response: response,
        parser: parser,
        format: ResponseFormat.single,
      );
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  /// POST request with list as data in the response
  Future<List<T>> postData<T>(
    String path, {
    required Map<String, dynamic> data,
    required JsonParser<T> parser,
  }) async {
    try {
      final response = await client.dio.post(path, data: data);
      return _parseResponse<List<T>>(
        response: response,
        parser: (list) => list.map<T>((item) => parser(item)).toList(),
        format: ResponseFormat.list,
      );
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  /// UPDATE request
  Future<T> update<T>(
    String path, {
    required Map<String, dynamic> data,
    required JsonParser<T> parser,
  }) async {
    try {
      final response = await client.dio.put(path, data: data);
      return _parseResponse<T>(
        response: response,
        parser: parser,
        format: ResponseFormat.single,
      );
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  /// DELETE request
  Future<void> delete<T>(String path) async {
    try {
      final response = await client.dio.delete(path);
      _parseResponse<void>(
        response: response,
        parser: (_) {},
        format: ResponseFormat.empty,
      );
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  /// UPDATE bulk request
  Future<void> updateBulk<T>(
    String path, {
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await client.dio.put(path, data: data);
      _parseResponse<void>(
        response: response,
        parser: (_) {},
        format: ResponseFormat.empty,
      );
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  /// DELETE bulk request
  Future<void> deleteBulk<T>(
    String path, {
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await client.dio.delete(path, data: data);
      return _parseResponse<void>(
        response: response,
        parser: (_) {},
        format: ResponseFormat.empty,
      );
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  T _parseResponse<T>({
    required Response response,
    required JsonParser<T> parser,
    required ResponseFormat format,
  }) {
    final statusCode = response.statusCode ?? 0;

    if (statusCode >= 200 && statusCode < 300) {
      final json = response.data;

      switch (format) {
        case ResponseFormat.single:
          final data = json['data'];
          return data == null ? null as T : parser(data);
        case ResponseFormat.list:
          final listData = json['data'] ?? [];
          if (listData is! List) {
            throw UnexpectedException(
                "Response Format Error: Expected list in 'data', but received ${listData.runtimeType}");
          }
          return parser(listData);
        case ResponseFormat.paginated:
          return parser(json['data']);
        case ResponseFormat.empty:
          return Future.value() as T;
      }
    }
    final message = response.data['message'] ?? response.data['error'] ?? 'Unknown error';

    if (statusCode >= 400 && statusCode < 500) {
      throw ClientException(message, code: statusCode);
    } else if (statusCode >= 500) {
      throw ServerException(message, code: statusCode);
    } else {
      throw UnexpectedException(message);
    }
  }

  AppException _mapDioError(DioException e) {
    final error = e.type;

    if (error == DioExceptionType.connectionError || error == DioExceptionType.unknown) {
      if (error is SocketException) {
        return NetworkException();
      } else {
        return ServerException('Unexpected network error.');
      }
    }

    if (error == DioExceptionType.connectionTimeout) {
      return ServerException('Connection timed out. Please try again.');
    } else if (error == DioExceptionType.sendTimeout) {
      return ServerException('Request timed out. Please try again.');
    } else if (error == DioExceptionType.receiveTimeout) {
      return ServerException('Server took too long to respond. Please try again.');
    } else if (error == DioExceptionType.badResponse) {
      final response = e.response;
      if (response != null && response.data != null) {
        if (response.data is Map<String, dynamic>) {
          final Map<String, dynamic> data = response.data;
          if (data.containsKey('message')) {
            return ServerException(data['message']);
          }
        }
        return ServerException('Received invalid status code: ${response.statusCode}');
      }
      return ServerException('Something went wrong with the response.');
    } else if (error == DioExceptionType.cancel) {
      return ServerException('Request was cancelled.');
    } else {
      return ServerException(e.message ?? 'Unexpected error.');
    }
  }
}
