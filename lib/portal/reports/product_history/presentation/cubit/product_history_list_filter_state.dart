part of 'product_history_list_filter_cubit.dart';

class ProductHistoryListFilterState extends Equatable {
  const ProductHistoryListFilterState({this.variantId, this.branchId, this.startDate, this.size = 20});

  final int? size;
  final int? variantId;
  final int? branchId;
  final String? startDate;

  @override
  List<Object?> get props => [variantId, branchId, startDate, size];

  ProductHistoryListFilterState copyWith({
    int? variantId,
    int? branchId,
    String? startDate,
    int? size,
    bool? nullVariantId = false,
    bool? nullBranchId = false,
    bool? nullStartDate = false,
  }) {
    return ProductHistoryListFilterState(
      variantId: nullVariantId == true ? null : variantId ?? this.variantId,
      branchId: nullBranchId == true ? null : branchId ?? this.branchId,
      startDate: nullStartDate == true ? null : startDate ?? this.startDate,
      size: size ?? this.size,
    );
  }
}
