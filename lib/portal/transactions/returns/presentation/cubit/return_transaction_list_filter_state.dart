part of 'return_transaction_list_filter_cubit.dart';

class ReturnTransactionListFilterState extends Equatable {
  const ReturnTransactionListFilterState({this.size = 20, this.search, this.branch});

  final int? size;
  final String? search;
  final int? branch;

  @override
  List<Object?> get props => [size, search, branch];

  ReturnTransactionListFilterState copyWith({
    int? size,
    String? search,
    int? branch,
  }) {
    return ReturnTransactionListFilterState(
      size: size ?? this.size,
      search: search ?? this.search,
      branch: branch ?? this.branch,
    );
  }
}
