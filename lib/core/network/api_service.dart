import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/dio_service.dart';
import 'package:medglobal_admin_portal/core/utils/typedefs.dart';

class ApiService {
  late final DioService _dioService;

  ApiService(DioService dioService) : _dioService = dioService;

  Future<List<T>> collection<T>(
    String endpoint, {
    JSON? queryParams,
    required T Function(JSON responseBody) converter,
  }) async {
    try {
      final response = await _dioService.get(endpoint, queryParams: queryParams);
      List<Object?> data = response.data!['items'];
      return data.map((item) => converter(item as JSON)).toList();
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (_) {
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
    } catch (_) {
      rethrow;
    }
  }

  Future<T> update<T>(
    String endpoint, {
    required JSON data,
    required T Function(JSON response) converter,
  }) async {
    try {
      final response = await _dioService.put<JSON>(endpoint, data: data);
      return converter(response.data!);
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (_) {
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
