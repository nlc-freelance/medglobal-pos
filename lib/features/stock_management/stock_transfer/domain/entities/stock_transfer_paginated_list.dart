import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/domain/entities/stock_transfer.dart';

class StockTransferPaginatedList extends Equatable {
  final List<StockTransfer>? stockTransfers;
  final int? currentPage;
  final int? totalPages;
  final int? totalCount;

  const StockTransferPaginatedList({
    this.stockTransfers,
    this.currentPage,
    this.totalPages,
    this.totalCount,
  });
  @override
  List<Object?> get props => [stockTransfers, currentPage, totalPages, totalCount];
}
