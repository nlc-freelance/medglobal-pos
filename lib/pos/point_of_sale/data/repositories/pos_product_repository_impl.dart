// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:medglobal_admin_portal/core/errors/failures.dart';
// import 'package:medglobal_admin_portal/pos/point_of_sale/data/api/pos_products_api.dart';
// import 'package:medglobal_admin_portal/pos/point_of_sale/domain/entities/pos_product_paginated_list.dart';
// import 'package:medglobal_admin_portal/pos/point_of_sale/domain/repositories/pos_product_repository.dart';
//
// class POSProductRepositoryImpl implements POSProductRepository {
//   final POSProductApi _posProductApi;
//
//   POSProductRepositoryImpl(this._posProductApi);
//
//   @override
//   Future<Either<Failure, POSProductPaginatedList>> getProductCatalog({
//     required int page,
//     String? search,
//     String? category,
//   }) async {
//     try {
//       final response = await _posProductApi.getProductCatalog(page: page, search: search, category: category);
//       return Right(response);
//     } on DioException catch (e) {
//       return Left(ServerFailure(e.message!));
//     }
//   }
// }
