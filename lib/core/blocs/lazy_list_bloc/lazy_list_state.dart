part of 'lazy_list_bloc.dart';

@freezed
class LazyListState<T> with _$LazyListState<T> {
  const factory LazyListState({
    required List<T> items,
    required bool hasReachedMax,
    required bool hasNoData,
    required bool isLoadingInitial,
    required bool isLoadingMore,
    String? error,
  }) = _LazyListState<T>;

  factory LazyListState.initial() => LazyListState<T>(
        items: [],
        hasReachedMax: false,
        hasNoData: false,
        isLoadingInitial: false,
        isLoadingMore: false,
        error: null,
      );
}
