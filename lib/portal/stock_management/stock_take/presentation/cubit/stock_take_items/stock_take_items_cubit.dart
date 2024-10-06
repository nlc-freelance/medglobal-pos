import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/usecases/update_stock_items_by_id_usecase.dart';

part 'stock_take_items_state.dart';

enum StockItemUpdate { CONFIRM, UNDO }

class StockTakeItemsCubit extends Cubit<StockTakeItemsState> {
  final UpdateStockTakeItemsByIdUseCase _updateStockTakeItemsByIdUseCase;
  StockTakeItemsCubit(this._updateStockTakeItemsByIdUseCase) : super(StockTakeItemsInitial());

  void reset() => emit(StockTakeItemsInitial());

  Future<void> updateStockTakeItems(StockItemUpdate type, {required int id, required Map<int, int?> items}) async {
    final stockItemId = items.entries.first.key;

    if (type == StockItemUpdate.CONFIRM && items.entries.any((entry) => entry.value == null)) {
      emit(
        StockTakeItemsNullCountedQtyError(stockItemId, message: 'Please provide counted quantity before confirming.'),
      );
      return;
    }
    emit(StockTakeItemsLoading(stockItemId));

    try {
      final result = await _updateStockTakeItemsByIdUseCase.call(UpdateStockTakeItemsByIdParams(id: id, items: items));
      result.fold(
        (error) => emit(StockTakeItemsError(stockItemId, message: error.message)),
        (_) => emit(StockTakeItemsSuccess()),
      );
    } catch (e) {
      emit(StockTakeItemsError(stockItemId, message: e.toString()));
    }
  }
}
