import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take.dart';

part 'stock_take_state.dart';

class StockTakeCubit extends Cubit<StockTakeState> {
  StockTakeCubit() : super(StockTakeState.initial());

  void setStockTake(StockTake stockTake) => emit(StockTakeState(stockTake));

  void setCountedQuantityPerItem({required int id, required int qty, required int difference}) {
    final items = state.stockTake.items?.toList() ?? [];

    final updatedItems = items.map((item) {
      if (item.id == id) {
        return item.copyWith(qtyCounted: qty, difference: difference);
      }
      return item;
    }).toList();

    emit(StockTakeState(state.stockTake.copyWith(items: updatedItems)));
  }

  void undoCountedItem({required int id}) {
    final items = state.stockTake.items?.toList() ?? [];

    final updatedItems = items.map((item) {
      if (item.id == id) return item.copyWith(qtyCounted: null, difference: item.qtyExpected);
      return item;
    }).toList();

    emit(StockTakeState(state.stockTake.copyWith(items: updatedItems)));
  }

  void setDescription(String value) => emit(StockTakeState(state.stockTake.copyWith(description: value)));
}
