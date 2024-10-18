part of 'sale_transaction_list_filter_cubit.dart';

class SaleTransactionListFilterState extends Equatable {
  const SaleTransactionListFilterState({this.size = 20, this.search, this.branchId});

  final int? size;
  final String? search;
  final int? branchId;

  @override
  List<Object?> get props => [size, search, branchId];

  SaleTransactionListFilterState copyWith({
    int? size,
    String? search,
    int? branchId,
  }) {
    return SaleTransactionListFilterState(
      size: size ?? this.size,
      search: search ?? this.search,
      branchId: branchId ?? this.branchId,
    );
  }
}
