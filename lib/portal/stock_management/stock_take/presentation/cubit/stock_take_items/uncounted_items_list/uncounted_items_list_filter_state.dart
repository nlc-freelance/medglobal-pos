part of 'uncounted_items_list_filter_cubit.dart';

class UncountedItemsListFilterState extends Equatable {
  const UncountedItemsListFilterState({this.size = 20, this.search});

  final int? size;
  final String? search;

  @override
  List<Object?> get props => [size, search];

  UncountedItemsListFilterState copyWith({
    int? size,
    String? search,
  }) {
    return UncountedItemsListFilterState(
      size: size ?? this.size,
      search: search ?? this.search,
    );
  }
}
