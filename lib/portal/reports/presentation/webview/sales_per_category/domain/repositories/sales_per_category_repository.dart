import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/domain/entities/filter.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/domain/entities/sales_per_category.dart';

abstract class SalesPerCategoryRepository {
  Future<Either<Failure, List<SalesPerCategory>>> getSalesPerCategory(SalesPerCategoryPayload payload);
}

class SalesPerCategoryPayload {
  final String? startDate;
  final String? endDate;
  final List<Filter>? branch;
  final List<Filter>? supplier;
  final List<Filter>? productCategory;
  final List<Filter>? productName;
  final String? filterOperator;
  final Map<String, dynamic>? groupedBy;

  SalesPerCategoryPayload({
    this.startDate,
    this.endDate,
    this.branch,
    this.supplier,
    this.productCategory,
    this.productName,
    this.filterOperator,
    this.groupedBy,
  });

  Map<String, dynamic> toJson() {
    return {
      'startDate': startDate,
      'endDate': endDate,
      if ([branch, supplier, productCategory, productName].any((filter) => filter?.isNotEmpty == true))
        '$filterOperator': {
          if (branch?.isNotEmpty == true) 'branch': branch?.toPayload,
          if (supplier?.isNotEmpty == true) 'supplier': supplier?.toPayload,
          if (productCategory?.isNotEmpty == true) 'productCategory': productCategory?.toPayload,
          if (productName?.isNotEmpty == true) 'productName': productName?.toPayload,
        },
      'groupedBy': groupedBy,
    }..removeWhere((_, value) => value == null);
  }

  @override
  String toString() {
    return 'SalesPerCategoryPayload{startDate: $startDate, endDate: $endDate, branch: $branch, supplier: $supplier, productCategory: $productCategory, productName: $productName, filterOperator: $filterOperator, groupedBy: $groupedBy}';
  }
}
