// import 'package:dartz/dartz.dart';
// import 'package:medglobal_admin_portal/core/errors/failures.dart';
// import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
// import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';
// import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/product_repository.dart';

// class CreateProductUseCase implements UseCase<void, CreateProductParams> {
//   final ProductRepository repository;

//   const CreateProductUseCase(this.repository);

//   @override
//   Future<Either<Failure, void>> call(CreateProductParams params) => repository.create(params.product);
// }

// class CreateProductParams {
//   final Product product;

//   CreateProductParams(this.product);
//   // final String name;
//   // final String category;
//   // final String? imageUrl;
//   // final List<Variant>? variants;

//   // CreateProductParams({required this.name, this.imageUrl, required this.category, this.variants});
// }
