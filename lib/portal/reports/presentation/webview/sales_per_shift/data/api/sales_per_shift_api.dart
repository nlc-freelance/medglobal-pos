import 'package:medglobal_admin_portal/core/network/old_api_service.dart';
import 'package:medglobal_admin_portal/core/network/new/api/api_service.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/data/dto/sales_per_shift_details_dto.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/data/dto/sales_per_shift_dto.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/domain/entities/sales_per_shift_paginated_list.dart';

class SalesPerShiftApi {
  final ApiService _api;

  SalesPerShiftApi({required ApiService api}) : _api = api;

  Future<SalesPerShiftPaginatedList> getSalesPerShift({
    required int page,
    required int size,
    int? branchId,
    String? startDate,
    String? endDate,
  }) async {
    final data = await _api.getPaginated<SalesPerShiftDto>(
      '/reports/shifts',
      queryParams: {
        'page': page,
        'size': size,
        if (branchId != null) 'branch': branchId,
        if (startDate != null) 'startDate': startDate,
        if (endDate != null) 'endDate': endDate,
      },
      parser: (json) => parse(json, SalesPerShiftDto.fromJson),
    );

    return SalesPerShiftPaginatedList(
      salesPerShift: data.items.map((item) => item.toEntity()).toList(),
      currentPage: data.page,
      totalPages: data.totalPages,
      totalCount: data.totalCount,
    );
  }

  Future<SalesPerShiftDetailsDto> getSalesPerShiftById(int id) async {
    final data = await _api.get<SalesPerShiftDetailsDto>(
      '/reports/shifts/$id',
      parser: (json) => parse(json, SalesPerShiftDetailsDto.fromJson),
    );

    return data;
  }
}
