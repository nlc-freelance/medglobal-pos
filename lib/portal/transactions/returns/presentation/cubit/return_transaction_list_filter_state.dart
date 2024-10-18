part of 'return_transaction_list_filter_cubit.dart';

class ReturnTransactionListFilterState extends Equatable {
  const ReturnTransactionListFilterState({this.size = 20, this.search, this.branchId});

  final int? size;
  final String? search;
  final int? branchId;

  @override
  List<Object?> get props => [size, search, branchId];

  ReturnTransactionListFilterState copyWith({
    int? size,
    String? search,
    int? branchId,
  }) {
    return ReturnTransactionListFilterState(
      size: size ?? this.size,
      search: search ?? this.search,
      branchId: branchId ?? this.branchId,
    );
  }
}
