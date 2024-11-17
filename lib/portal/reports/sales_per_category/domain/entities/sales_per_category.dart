import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'sales_per_category.g.dart';

@JsonSerializable()
class SalesPerCategory {
  final String? productCategory;
  final int? totalItemsSold;
  final int? totalItemsReturned;
  final int? itemNetCount;
  final double? totalSalesAmount;
  final double? totalReturnedAmount;
  final double? totalDiscountAmount;
  final double? itemNetSales;
  final String? branch;
  final String? timeVariable;

  const SalesPerCategory({
    this.productCategory,
    this.totalItemsSold,
    this.totalItemsReturned,
    this.itemNetCount,
    this.totalSalesAmount,
    this.totalReturnedAmount,
    this.totalDiscountAmount,
    this.itemNetSales,
    this.branch,
    this.timeVariable,
  });

  String? get groupByDataGridValue {
    if (branch != null && timeVariable != null) return '$branch, $timeVariable';
    if (branch != null) return '$branch';
    if (timeVariable != null) return '$timeVariable';
    return null;
  }

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<String>(columnName: 'group_by', value: groupByDataGridValue),
          DataGridCell<String>(columnName: 'product_category', value: productCategory),
          DataGridCell<int>(columnName: 'total_items_sold', value: totalItemsSold),
          DataGridCell<int>(columnName: 'total_items_returned', value: totalItemsReturned),
          DataGridCell<int>(columnName: 'item_net_count', value: itemNetCount),
          DataGridCell<double>(columnName: 'total_sales_amt', value: totalSalesAmount),
          DataGridCell<double>(columnName: 'total_returned_amt', value: totalReturnedAmount),
          DataGridCell<double>(columnName: 'total_discount_amt', value: totalDiscountAmount),
          DataGridCell<double>(columnName: 'item_net_sales', value: itemNetSales),
        ],
      );

  factory SalesPerCategory.fromJson(Map<String, dynamic> json) => _$SalesPerCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SalesPerCategoryToJson(this);

  @override
  String toString() {
    return 'SalesPerCategory{productCategory: $productCategory, totalItemsSold: $totalItemsSold, totalItemsReturned: $totalItemsReturned, itemNetCount: $itemNetCount, totalSalesAmount: $totalSalesAmount, totalReturnedAmount: $totalReturnedAmount, totalDiscountAmount: $totalDiscountAmount, itemNetSales: $itemNetSales, branch: $branch, timeVariable: $timeVariable}';
  }
}
