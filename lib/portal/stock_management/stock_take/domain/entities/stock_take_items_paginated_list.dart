import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_item.dart';

class StockTakeItemsPaginatedList extends Equatable {
  final List<StockTakeItem>? stockTakeItems;
  final int? currentPage;
  final int? totalPages;
  final int? totalCount;

  const StockTakeItemsPaginatedList({
    this.stockTakeItems,
    this.currentPage,
    this.totalPages,
    this.totalCount,
  });
  @override
  List<Object?> get props => [stockTakeItems, currentPage, totalPages, totalCount];
}
