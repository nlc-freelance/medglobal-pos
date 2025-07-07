import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/domain/entities/sales_per_category.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/domain/repositories/sales_per_category_repository.dart';

class GetSalesPerCategoryUseCase implements UseCase<List<SalesPerCategory>, GetSalesPerCategoryParams> {
  final SalesPerCategoryRepository repository;

  const GetSalesPerCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, List<SalesPerCategory>>> call(GetSalesPerCategoryParams params) =>
      repository.getSalesPerCategory(params.payload);
}

class GetSalesPerCategoryParams {
  final SalesPerCategoryPayload payload;

  GetSalesPerCategoryParams({required this.payload});
}
