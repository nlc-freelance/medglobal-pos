import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/repositories/product_repository.dart';

class BulkDeleteProductsUseCase implements UseCase<void, BulkDeleteProductsParams> {
  final ProductRepository _repository;

  BulkDeleteProductsUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(BulkDeleteProductsParams params) => _repository.bulkDelete(params.ids);
}

class BulkDeleteProductsParams {
  final List<int> ids;

  BulkDeleteProductsParams(this.ids);
}
