// import 'package:dartz/dartz.dart';
// import 'package:medglobal_admin_portal/core/core.dart';
// import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product_paginated_list.dart';
// import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/product_repository.dart';

// class GetProductsUseCase implements UseCase<ProductPaginatedList, GetProductsParams> {
//   final ProductRepository _repository;

//   GetProductsUseCase(this._repository);

//   @override
//   Future<Either<Failure, ProductPaginatedList>> call(GetProductsParams params) => _repository.getProducts(
//         page: params.page,
//         size: params.size,
//         search: params.search,
//       );
// }

// class GetProductsParams {
//   final int page;
//   final int size;
//   final String? search;

//   GetProductsParams(this.page, this.size, this.search);
// }
