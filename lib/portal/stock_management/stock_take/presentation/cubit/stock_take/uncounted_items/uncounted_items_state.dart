part of 'uncounted_items_cubit.dart';

class UncountedItemsState extends Equatable {
  const UncountedItemsState(this.uncountedItems);

  final List<StockTakeItem>? uncountedItems;

  @override
  List<Object?> get props => [uncountedItems];
}
