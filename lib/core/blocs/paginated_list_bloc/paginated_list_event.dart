part of 'paginated_list_bloc.dart';

@freezed
class PaginatedListEvent with _$PaginatedListEvent {
  const factory PaginatedListEvent.fetch({int? page, int? size}) = _Fetch;
  const factory PaginatedListEvent.reset() = _Reset;
}
