import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/reports/product_history/data/dto/product_history_item_dto.dart';

class ProductHistoryPaginatedList extends Equatable {
  final List<ProductHistoryItemDto>? productHistoryItems;
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
