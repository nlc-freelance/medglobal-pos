part of 'paginated_list_bloc.dart';

@freezed
class PaginatedListState<T> with _$PaginatedListState<T> {
  const factory PaginatedListState.initial() = _Initial<T>;
  const factory PaginatedListState.loading() = _Loading<T>;
  const factory PaginatedListState.loaded(PaginatedList<T> data) = _Loaded<T>;
  const factory PaginatedListState.empty() = _Empty<T>;
  const factory PaginatedListState.failure(String message) = _Failure<T>;
}
