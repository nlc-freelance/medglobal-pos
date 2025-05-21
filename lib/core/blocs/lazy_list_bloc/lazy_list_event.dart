part of 'lazy_list_bloc.dart';

@freezed
class LazyListEvent<T> with _$LazyListEvent<T> {
  const factory LazyListEvent.fetch() = _Fetch<T>;
  const factory LazyListEvent.refresh() = _Refresh<T>;
  const factory LazyListEvent.reset() = _Reset<T>;
}
