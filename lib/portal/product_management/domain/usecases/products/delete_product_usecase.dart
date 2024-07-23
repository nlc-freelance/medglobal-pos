import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/product_repository.dart';

class DeleteProductUseCase implements UseCase<void, DeleteProductParams> {
  final ProductRepository repository;

  const DeleteProductUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteProductParams params) => repository.delete(params.id);
}

class DeleteProductParams {
  final int id;

  DeleteProductParams(this.id);
}
