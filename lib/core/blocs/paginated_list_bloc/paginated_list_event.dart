part of 'paginated_list_bloc.dart';

@freezed
class PaginatedListEvent<T> with _$PaginatedListEvent<T> {
  const factory PaginatedListEvent.fetch({FilterList? filters}) = _Fetch<T>;
  const factory PaginatedListEvent.reset() = _Reset<T>;
}
