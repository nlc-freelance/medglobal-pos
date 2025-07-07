import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/data/dto/sales_per_shift_details_dto.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/data/dto/sales_per_shift_dto.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/domain/entities/sales_per_shift_paginated_list.dart';

abstract class SalesPerShiftApi {
  Future<SalesPerShiftPaginatedList> getSalesPerShift({
    required int page,
    required int size,
    int? branchId,
    String? startDate,
    String? endDate,
  });
  Future<SalesPerShiftDetailsDto> getSalesPerShiftById(int id);
}

class SalesPerShiftApiImpl implements SalesPerShiftApi {
  final ApiService _apiService;

  SalesPerShiftApiImpl(this._apiService);

  @override
  Future<SalesPerShiftPaginatedList> getSalesPerShift({
    required int page,
    required int size,
    int? branchId,
    String? startDate,
    String? endDate,
  }) async {
    try {
      final response = await _apiService.collection<SalesPerShiftDto>(
        '/reports/shifts',
        queryParams: {
          'page': page,
          'size': size,
          if (branchId != null) 'branch': branchId,
          if (startDate != null) 'startDate': startDate,
          if (endDate != null) 'endDate': endDate,
        },
        converter: SalesPerShiftDto.fromJson,
      );

      return SalesPerShiftPaginatedList(
        salesPerShift: response.items?.map((item) => item.toEntity()).toList(),
        currentPage: response.pageInfo?.page,
        totalPages: response.pageInfo?.totalPages,
        totalCount: response.pageInfo?.totalCount,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SalesPerShiftDetailsDto> getSalesPerShiftById(int id) async {
    try {
      return await _apiService.get<SalesPerShiftDetailsDto>(
        '/reports/shifts/$id',
        converter: SalesPerShiftDetailsDto.fromJson,
      );
    } catch (_) {
      rethrow;
    }
  }
}
