import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

class TransactionPaginatedList extends Equatable {
  final List<Transaction>? transactions;
  final int? currentPage;
  final int? totalPages;
  final int? totalCount;

  const TransactionPaginatedList({
    this.transactions,
    this.currentPage,
    this.totalPages,
    this.totalCount,
  });
  @override
  List<Object?> get props => [transactions, currentPage, totalPages, totalCount];
}
