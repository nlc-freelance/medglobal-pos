import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/domain/entities/sales_per_shift_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/domain/repositories/sales_per_shift_repository.dart';

class GetSalesPerShiftUseCase implements UseCase<SalesPerShiftPaginatedList, GetSalesPerShiftParams> {
  final SalesPerShiftRepository _repository;

  GetSalesPerShiftUseCase(this._repository);

  @override
  Future<Either<Failure, SalesPerShiftPaginatedList>> call(GetSalesPerShiftParams params) =>
      _repository.getSalesPerShift(
        page: params.page,
        size: params.size,
        branchId: params.branchId,
        startDate: params.startDate,
        endDate: params.endDate,
      );
}

class GetSalesPerShiftParams {
  final int page;
  final int size;
  final int? branchId;
  final String? startDate;
  final String? endDate;

  GetSalesPerShiftParams({required this.page, required this.size, this.branchId, this.startDate, this.endDate});
}
