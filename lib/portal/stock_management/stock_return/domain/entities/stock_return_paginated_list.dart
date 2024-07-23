import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return.dart';

class StockReturnPaginatedList extends Equatable {
  final List<StockReturn>? stockReturns;
  final int? currentPage;
  final int? totalPages;
  final int? totalCount;

  const StockReturnPaginatedList({
    this.stockReturns,
    this.currentPage,
    this.totalPages,
    this.totalCount,
  });
  @override
  List<Object?> get props => [stockReturns, currentPage, totalPages, totalCount];
}
