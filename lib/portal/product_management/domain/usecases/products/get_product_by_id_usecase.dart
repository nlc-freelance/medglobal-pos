import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/product_repository.dart';

class GetProductByIdUseCase implements UseCase<Product, GetProductByIdParams> {
  final ProductRepository repository;

  const GetProductByIdUseCase(this.repository);

  @override
  Future<Either<Failure, Product>> call(GetProductByIdParams params) => repository.getProductById(params.id);
}

class GetProductByIdParams {
  final int id;

  GetProductByIdParams(this.id);
}
