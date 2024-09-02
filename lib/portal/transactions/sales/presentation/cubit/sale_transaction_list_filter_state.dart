part of 'sale_transaction_list_filter_cubit.dart';

class SaleTransactionListFilterState extends Equatable {
  const SaleTransactionListFilterState({this.size = 20, this.search, this.branch});

  final int? size;
  final String? search;
  final int? branch;

  @override
  List<Object?> get props => [size, search, branch];

  SaleTransactionListFilterState copyWith({
    int? size,
    String? search,
    int? branch,
  }) {
    return SaleTransactionListFilterState(
      size: size ?? this.size,
      search: search ?? this.search,
      branch: branch ?? this.branch,
    );
  }
}
