part of 'sales_per_shift_filter_cubit.dart';

class SalesPerShiftListFilterState extends Equatable {
  const SalesPerShiftListFilterState({this.size = 20, this.branchId, this.startDate, this.endDate});

  final int? size;
  final int? branchId;
  final String? startDate;
  final String? endDate;

  @override
  List<Object?> get props => [size, branchId, startDate, endDate];

  SalesPerShiftListFilterState copyWith({
    int? size,
    int? branchId,
    String? startDate,
    String? endDate,
    bool? nullBranch = false,
    bool? nullStartDate = false,
    bool? nullEndDate = false,
  }) {
    return SalesPerShiftListFilterState(
      size: size ?? this.size,
      branchId: nullBranch == true ? null : branchId ?? this.branchId,
      startDate: nullStartDate == true ? null : startDate ?? this.startDate,
      endDate: nullEndDate == true ? null : endDate ?? this.endDate,
    );
  }
}
