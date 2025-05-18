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
      throw ServerException(_mapDioError(e));
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
      throw ServerException(_mapDioError(e));
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
      throw ServerException(_mapDioError(e));
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
      return BaseApiResponse.fromJson(response.data, fromJson);
    } on DioException catch (e) {
      throw ServerException(_mapDioError(e));
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
      return BaseApiResponse.fromJson(response.data, fromJson);
    } on DioException catch (e) {
      throw ServerException(_mapDioError(e));
    } catch (e) {
      throw UnexpectedException(e.toString());
    }
  }

  /// DELETE request
  Future<void> delete<T>(String path) async {
    try {
      await _dioService.dio.delete(path);
    } on DioException catch (e) {
      throw ServerException(_mapDioError(e));
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
      await _dioService.dio.post(path, data: data);
    } on DioException catch (e) {
      throw ServerException(_mapDioError(e));
    } catch (e) {
      throw UnexpectedException(e.toString());
    }
  }

  String _mapDioError(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout) {
      return 'Connection timed out. Please try again.';
    } else if (error.type == DioExceptionType.sendTimeout) {
      return 'Request timed out. Please try again.';
    } else if (error.type == DioExceptionType.receiveTimeout) {
      return 'Server took too long to respond. Please try again.';
    } else if (error.type == DioExceptionType.badResponse) {
      final response = error.response;
      if (response != null && response.data != null) {
        // Handle error from API response body
        if (response.data is Map<String, dynamic>) {
          final Map<String, dynamic> data = response.data;
          if (data.containsKey('message')) {
            return data['message'];
          }
        }
        return 'Received invalid status code: ${response.statusCode}';
      }
      return 'Something went wrong with the response.';
    } else if (error.type == DioExceptionType.cancel) {
      return 'Request was cancelled.';
    }

    return error.message ?? 'An unexpected error occurred.';
  }
}
