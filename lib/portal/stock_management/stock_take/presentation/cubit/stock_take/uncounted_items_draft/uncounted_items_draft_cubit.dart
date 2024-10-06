import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'uncounted_items_draft_state.dart';

class UncountedItemsDraftCubit extends Cubit<UncountedItemsDraftState> {
  UncountedItemsDraftCubit() : super(const UncountedItemsDraftState({}));

  void addCountedItemDraft(int id, int? qty) {
    final uncountedItemsDraft = {...state.uncountedItems};

    if (uncountedItemsDraft.containsKey(id)) {
      uncountedItemsDraft[id] = qty;
    } else {
      Map<int, int?> newMap = {id: qty};
      uncountedItemsDraft.addAll(newMap);
    }

    emit(UncountedItemsDraftState(uncountedItemsDraft));
  }

  void removeCountedItemFromDraft(int id) {
    final uncountedItemsDraft = {...state.uncountedItems};

    uncountedItemsDraft.remove(id);

    emit(UncountedItemsDraftState(uncountedItemsDraft));
  }

  void reset() => emit(const UncountedItemsDraftState({}));
}
