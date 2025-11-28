import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/domain/entities/sales_per_category.dart';

part 'sales_per_category_dto.g.dart';

@JsonSerializable()
class SalesPerCategoryDto {
  final String? productCategory;
  @JsonKey(name: 'totalSoldItems')
  final int? totalItemsSold;
  @JsonKey(name: 'totalReturnedItems')
  final int? totalItemsReturned;
  final int? itemNetCount;
  final double? totalSalesAmount;
  final double? totalReturnedAmount;
  final double? totalDiscountAmount;
  final double? itemNetSales;
  final String? branch;
  final String? timeVariance;

  const SalesPerCategoryDto({
    this.productCategory,
    this.totalItemsSold,
    this.totalItemsReturned,
    this.itemNetCount,
    this.totalSalesAmount,
    this.totalReturnedAmount,
    this.totalDiscountAmount,
    this.itemNetSales,
    this.branch,
    this.timeVariance,
  });

  SalesPerCategory toEntity() => SalesPerCategory(
        productCategory: productCategory,
        totalItemsSold: totalItemsSold,
        totalItemsReturned: totalItemsReturned,
        itemNetCount: itemNetCount,
        totalSalesAmount: totalSalesAmount,
        totalReturnedAmount: totalReturnedAmount,
        totalDiscountAmount: totalDiscountAmount,
        itemNetSales: itemNetSales,
        branch: branch,
        timeVariance: timeVariance,
      );

  factory SalesPerCategoryDto.fromJson(Map<String, dynamic> json) => _$SalesPerCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SalesPerCategoryDtoToJson(this);
}
