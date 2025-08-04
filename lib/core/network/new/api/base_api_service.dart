import 'dart:io';

import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';

class BaseApiService {
  final DioServiceNew _dioService;

  BaseApiService(this._dioService);

  /// GET request for single object
  Future<BaseApiResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParams,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dioService.dio.get(path);
      return BaseApiResponse.fromJson(response.data, fromJson);
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw UnexpectedException(e.toString());
    }
  }

  /// GET request for list
  Future<BaseApiResponse<List<T>>> getList<T>(
    String path, {
    Map<String, dynamic>? queryParams,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dioService.dio.get(path, queryParameters: queryParams);
      return BaseApiResponse.fromJsonList(response.data, (list) => list.map((item) => fromJson(item)).toList());
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw UnexpectedException(e.toString());
    }
  }

  /// GET request for paginated list
  Future<BaseApiResponse<Paginated<T>>> getPaginated<T>(
    String path, {
    Map<String, dynamic>? queryParams,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dioService.dio.get(path, queryParameters: queryParams);
      return BaseApiResponse.fromJson(response.data, (json) => Paginated<T>.fromJson(json, fromJson));
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw UnexpectedException(e.toString());
    }
  }

  /// POST request
  Future<BaseApiResponse<T>> post<T>(
    String path, {
    required Map<String, dynamic> data,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dioService.dio.post(path, data: data);

      if (response.data == null) {
        throw UnexpectedException('No data returned.');
      }

      return BaseApiResponse.fromJson(response.data, fromJson);
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw UnexpectedException(e.toString());
    }
  }

  /// UPDATE request
  Future<BaseApiResponse<T>> update<T>(
    String path, {
    required Map<String, dynamic> data,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dioService.dio.put(path, data: data);

      if (response.data == null) {
        throw UnexpectedException('No data returned.');
      }

      return BaseApiResponse.fromJson(response.data, fromJson);
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw UnexpectedException(e.toString());
    }
  }

  /// DELETE request
  Future<void> delete<T>(String path) async {
    try {
      await _dioService.dio.delete(path);
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw UnexpectedException(e.toString());
    }
  }

  /// UPDATE bulk request
  Future<void> updateBulk<T>(
    String path, {
    required Map<String, dynamic> data,
  }) async {
    try {
      await _dioService.dio.put(path, data: data);
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw UnexpectedException(e.toString());
    }
  }

  /// DELETE bulk request
  Future<void> deleteBulk<T>(
    String path, {
    required Map<String, dynamic> data,
  }) async {
    try {
      await _dioService.dio.delete(path, data: data);
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw UnexpectedException(e.toString());
    }
  }

  AppException _mapDioError(DioException error) {
    print(error.type);
    if (error.type == DioExceptionType.connectionTimeout) {
      return ServerException('Connection timed out. Please try again.');
    } else if (error.type == DioExceptionType.sendTimeout) {
      return ServerException('Request timed out. Please try again.');
    } else if (error.type == DioExceptionType.receiveTimeout) {
      return ServerException('Server took too long to respond. Please try again.');
    } else if (error.type == DioExceptionType.badResponse) {
      final response = error.response;
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
    } else if (error.type == DioExceptionType.cancel) {
      return ServerException('Request was cancelled.');
    } else if (error.type == DioExceptionType.unknown || error.type == DioExceptionType.connectionError) {
      if (error.error is SocketException) {
        return NetworkException('No internet connection. Please check your network and try again.');
      }
      return ServerException('Unexpected network error occurred.');
    } else {
      return ServerException(error.message ?? 'An unexpected error occurred.');
    }
  }
}
