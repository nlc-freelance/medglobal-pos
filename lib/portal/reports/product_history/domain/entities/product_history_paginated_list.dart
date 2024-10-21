import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/reports/product_history/domain/entities/product_history_item.dart';

class ProductHistoryPaginatedList extends Equatable {
  final List<ProductHistoryItem>? productHistoryItems;
  final int? currentPage;
  final int? totalPages;
  final int? totalCount;

  const ProductHistoryPaginatedList({
    this.productHistoryItems,
    this.currentPage,
    this.totalPages,
    this.totalCount,
  });
  @override
  List<Object?> get props => [productHistoryItems, currentPage, totalPages, totalCount];
}
