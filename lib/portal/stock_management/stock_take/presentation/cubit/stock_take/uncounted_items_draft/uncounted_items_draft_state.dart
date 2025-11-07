part of 'uncounted_items_draft_cubit.dart';

class UncountedItemsDraftState extends Equatable {
  const UncountedItemsDraftState(this.uncountedItems);

  final Map<int, int?> uncountedItems;

  @override
  List<Object?> get props => [uncountedItems];
}
