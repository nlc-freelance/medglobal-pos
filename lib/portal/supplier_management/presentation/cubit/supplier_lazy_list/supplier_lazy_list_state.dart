part of 'supplier_lazy_list_cubit.dart';

@JsonSerializable()
class SupplierLazyListState extends Equatable {
  const SupplierLazyListState({
    required this.suppliers,
    required this.hasReachedMax,
    required this.hasNoData,
    this.isInitLoading = false,
    this.isLoadingMore = false,
    this.error,
  });

  final List<Supplier> suppliers;
  final bool hasNoData;
  final bool hasReachedMax;
  final bool isInitLoading;
  final bool isLoadingMore;
  final String? error;

  @override
  List<Object?> get props => [suppliers, hasNoData, hasReachedMax, isInitLoading, isLoadingMore, error];

  factory SupplierLazyListState.initial() => const SupplierLazyListState(
        suppliers: [],
        hasNoData: false,
        hasReachedMax: false,
      );

  SupplierLazyListState copyWith({
    List<Supplier>? suppliers,
    bool? hasReachedMax,
    bool? hasNoData,
    bool? isInitLoading,
    bool? isLoadingMore,
    String? error,
  }) {
    return SupplierLazyListState(
      suppliers: suppliers ?? this.suppliers,
      hasNoData: hasNoData ?? this.hasNoData,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isInitLoading: isInitLoading ?? this.isInitLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: error,
    );
  }

  bool get INITIAL_LOADING => isInitLoading;

  bool get EMPTY => hasNoData;

  bool get ERROR => error != null;

  @override
  String toString() {
    return 'SupplierLazyListState{suppliers: $suppliers, hasNoData: $hasNoData, hasReachedMax: $hasReachedMax, isInitLoading: $isInitLoading, isLoadingMore: $isLoadingMore, error: $error}';
  }
}
