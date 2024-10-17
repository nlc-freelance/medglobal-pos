import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/entities/pos_product_paginated_list.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/repositories/pos_product_repository.dart';

class GetPOSProductsUseCase implements UseCase<POSProductPaginatedList, GetPOSProductsParams> {
  final POSProductRepository _repository;

  GetPOSProductsUseCase(this._repository);

  @override
  Future<Either<Failure, POSProductPaginatedList>> call(GetPOSProductsParams params) => _repository.getPOSProducts(
        page: params.page,
        search: params.search,
        category: params.category,
      );
}

class GetPOSProductsParams {
  final int page;
  final String? search;
  final String? category;

  GetPOSProductsParams({required this.page, this.search, this.category});
}
