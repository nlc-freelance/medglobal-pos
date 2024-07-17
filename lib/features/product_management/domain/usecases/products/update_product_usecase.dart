import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/repositories/product_repository.dart';

class UpdateProductUseCase implements UseCase<void, UpdateProductParams> {
  final ProductRepository repository;

  const UpdateProductUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateProductParams params) => repository.update(params.id, params.product);
}

class UpdateProductParams {
  final int id;
  final Product product;

  UpdateProductParams(this.id, {required this.product});
}
