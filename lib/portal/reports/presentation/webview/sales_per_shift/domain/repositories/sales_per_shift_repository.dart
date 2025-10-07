import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/domain/entities/sales_per_shift_details.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/domain/entities/sales_per_shift_paginated_list.dart';

abstract class SalesPerShiftRepository {
  Future<ApiResult<SalesPerShiftPaginatedList>> getSalesPerShift({
    required int page,
    required int size,
    int? branchId,
    String? startDate,
    String? endDate,
  });

  Future<ApiResult<SalesPerShiftDetails>> getSalesPerShiftById(int id);
}
