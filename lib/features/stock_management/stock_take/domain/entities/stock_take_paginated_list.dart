import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/entities/stock_take.dart';

class StockTakePaginatedList extends Equatable {
  final List<StockTake>? stockTakes;
  final int? currentPage;
  final int? totalPages;
  final int? totalCount;

  const StockTakePaginatedList({
    this.stockTakes,
    this.currentPage,
    this.totalPages,
    this.totalCount,
  });
  @override
  List<Object?> get props => [stockTakes, currentPage, totalPages, totalCount];
}
