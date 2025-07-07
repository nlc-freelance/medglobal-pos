import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';

part 'params.freezed.dart';

@freezed
class ProductABCParams with _$ProductABCParams implements ProductPerformanceParams {
  const factory ProductABCParams({
    Branch? branch,
  }) = _ProductABCParams;
}

@freezed
class ProductPNLParams with _$ProductPNLParams implements ProductPerformanceParams {
  const factory ProductPNLParams({
    List<Category>? categories,
    int? topN,
  }) = _ProductPNLParams;
}

abstract class ProductPerformanceParams {}
