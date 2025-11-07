part of 'counted_items_list_filter_cubit.dart';

class CountedItemsListFilterState extends Equatable {
  const CountedItemsListFilterState({this.size = 20, this.search});

  final int? size;
  final String? search;

  @override
  List<Object?> get props => [size, search];

  CountedItemsListFilterState copyWith({
    int? size,
    String? search,
  }) {
    return CountedItemsListFilterState(
      size: size ?? this.size,
      search: search ?? this.search,
    );
  }
}
