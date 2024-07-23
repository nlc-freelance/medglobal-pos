import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/product_repository.dart';

class BulkUpdateProductsUseCase implements UseCase<void, BulkUpdateProductsParams> {
  final ProductRepository _repository;

  BulkUpdateProductsUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(BulkUpdateProductsParams params) =>
      _repository.bulkUpdate(params.ids, params.category);
}

class BulkUpdateProductsParams {
  final List<int> ids;
  final Category? category;

  BulkUpdateProductsParams(this.ids, this.category);
}
