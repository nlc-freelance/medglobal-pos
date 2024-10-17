import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/portal/reports/product_history/domain/entities/product_history_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/reports/product_history/domain/repositories/product_history_repository.dart';

class GetProductHistoryUseCase implements UseCase<ProductHistoryPaginatedList, GetProductHistoryParams> {
  final ProductHistoryRepository repository;

  const GetProductHistoryUseCase(this.repository);

  @override
  Future<Either<Failure, ProductHistoryPaginatedList>> call(GetProductHistoryParams params) =>
      repository.getProductHistory(
        variantId: params.variantId,
        branchId: params.branchId,
        startDate: params.startDate,
        page: params.page,
        size: params.size,
      );
}

class GetProductHistoryParams {
  final int page;
  final int size;
  final int variantId;
  final int branchId;
  final String startDate;

  GetProductHistoryParams({
    required this.page,
    required this.size,
    required this.variantId,
    required this.branchId,
    required this.startDate,
  });
}
