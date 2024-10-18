import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/entities/pos_product_paginated_list.dart';

abstract class POSProductRepository {
  Future<Either<Failure, POSProductPaginatedList>> getPOSProducts(
      {required int page, String? search, String? category});
}
