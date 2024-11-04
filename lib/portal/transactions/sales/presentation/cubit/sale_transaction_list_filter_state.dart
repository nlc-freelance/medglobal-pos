part of 'sale_transaction_list_filter_cubit.dart';

class SaleTransactionListFilterState extends Equatable {
  const SaleTransactionListFilterState({this.size = 20, this.search, this.branchId, this.startDate, this.endDate});

  final int? size;
  final String? search;
  final int? branchId;
  final String? startDate;
  final String? endDate;

  @override
  List<Object?> get props => [size, search, branchId, startDate, endDate];

  SaleTransactionListFilterState copyWith({
    int? size,
    String? search,
    int? branchId,
    String? startDate,
    String? endDate,
    bool? nullBranch = false,
    bool? nullStartDate = false,
    bool? nullEndDate = false,
  }) {
    return SaleTransactionListFilterState(
      size: size ?? this.size,
      search: search ?? this.search,
      branchId: nullBranch == true ? null : branchId ?? this.branchId,
      startDate: nullStartDate == true ? null : startDate ?? this.startDate,
      endDate: nullEndDate == true ? null : endDate ?? this.endDate,
    );
  }
}
