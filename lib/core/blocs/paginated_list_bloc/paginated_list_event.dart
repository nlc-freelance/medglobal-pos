part of 'paginated_list_bloc.dart';

@freezed
class PaginatedListEvent<T> with _$PaginatedListEvent<T> {
  const factory PaginatedListEvent.fetch({@Default(PageQuery()) PageQuery query}) = _Fetch<T>;
  const factory PaginatedListEvent.reset() = _Reset<T>;
}
