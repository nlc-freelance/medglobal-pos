import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_item.dart';

part 'uncounted_items_state.dart';

class UncountedItemsCubit extends Cubit<UncountedItemsState> {
  UncountedItemsCubit() : super(const UncountedItemsState([]));

  void setUncountedItemsTemp(List<StockTakeItem> items) {
    emit(UncountedItemsState(items));
  }

  void updateItem(int id, int? qty) {
    emit(UncountedItemsState(
        state.uncountedItems?.map((item) => item.id == id ? item.copyWith(qtyCounted: qty) : item).toList()));
  }
}
