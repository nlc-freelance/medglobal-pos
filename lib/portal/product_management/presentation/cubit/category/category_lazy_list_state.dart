part of 'category_lazy_list_cubit.dart';

@JsonSerializable()
class CategoryLazyListState extends Equatable {
  const CategoryLazyListState({
    required this.categories,
    required this.hasReachedMax,
    required this.hasNoData,
    this.isInitLoading = false,
    this.isLoadingMore = false,
    this.error,
  });

  final List<Category> categories;
  final bool hasNoData;
  final bool hasReachedMax;
  final bool isInitLoading;
  final bool isLoadingMore;
  final String? error;

  @override
  List<Object?> get props => [categories, hasNoData, hasReachedMax, isInitLoading, isLoadingMore, error];

  factory CategoryLazyListState.initial() => const CategoryLazyListState(
        categories: [],
        hasNoData: false,
        hasReachedMax: false,
      );

  CategoryLazyListState copyWith({
    List<Category>? categories,
    bool? hasReachedMax,
    bool? hasNoData,
    bool? isInitLoading,
    bool? isLoadingMore,
    String? error,
  }) {
    return CategoryLazyListState(
      categories: categories ?? this.categories,
      hasNoData: hasNoData ?? this.hasNoData,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isInitLoading: isInitLoading ?? this.isInitLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: error ?? this.error,
    );
  }

  bool get INITIAL_LOADING => isInitLoading;

  bool get EMPTY => hasNoData;

  bool get ERROR => error != null;

  @override
  String toString() {
    return 'CategoryLazyListState{categories: $categories, hasNoData: $hasNoData, hasReachedMax: $hasReachedMax, isInitLoading: $isInitLoading, isLoadingMore: $isLoadingMore, error: $error}';
  }
}
