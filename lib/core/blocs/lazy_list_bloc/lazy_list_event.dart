part of 'lazy_list_bloc.dart';

@freezed
class LazyListEvent<T> with _$LazyListEvent<T> {
  const factory LazyListEvent.fetch({@Default(false) bool forceRefresh}) = _Fetch<T>;
  const factory LazyListEvent.reset() = _Reset<T>;
}
