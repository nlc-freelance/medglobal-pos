import 'package:dio/dio.dart';
import '../core.dart';
import 'dio_service.dart';
import 'models/api_response.dart';
import '../utils/typedefs.dart';

class ApiService {
  late final DioService _dioService;

  ApiService(DioService dioService) : _dioService = dioService;

  Future<ApiResponse<T>> collection<T>(
    String endpoint, {
    JSON? queryParams,
    required T Function(JSON responseBody) converter,
  }) async {
    try {
      final response = await _dioService.get(endpoint, queryParams: queryParams);
      List<Object?> data = response.data!['items'];
      final items = data.map((item) => converter(item as JSON)).toList();
      return ApiResponse(
        message: response.message,
        items: items,
        pageInfo: PageInfo(
          page: response.data['page'],
          totalCount: response.data['totalCount'],
          totalPages: response.data['totalPages'],
        ),
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<T> get<T>(
    String endpoint, {
    JSON? queryParams,
    required T Function(JSON response) converter,
  }) async {
    try {
      final response = await _dioService.get<JSON>(endpoint, queryParams: queryParams);
      return converter(response.data!);
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (_) {
      rethrow;
    }
  }

  Future<T> post<T>(
    String endpoint, {
    required JSON data,
    required T Function(JSON response) converter,
  }) async {
    try {
      final response = await _dioService.post<JSON>(endpoint, data: data);
      return converter(response.data!);
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<T?> update<T>(
    String endpoint, {
    required JSON data,
    required T Function(JSON response) converter,
  }) async {
    try {
      final response = await _dioService.put<JSON>(endpoint, data: data);
      if (response.data != null) return converter(response.data!);
      return null;
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete<T>(String endpoint, {JSON? data}) async {
    try {
      await _dioService.delete<JSON>(endpoint, data: data);
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (_) {
      rethrow;
    }
  }

  DioException _handleDioException(DioException e) => e.copyWith(message: e.response?.data['message']);
}
