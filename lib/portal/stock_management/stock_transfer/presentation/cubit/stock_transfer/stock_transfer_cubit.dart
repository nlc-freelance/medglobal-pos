import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer_item.dart';

part 'stock_transfer_state.dart';

class StockTransferCubit extends Cubit<StockTransferState> {
  StockTransferCubit() : super(StockTransferState.initial());

  void reset() => emit(StockTransferState.initial());

  void setStockTransfer(StockTransfer stockTransfer) => emit(StockTransferState(stockTransfer));

  void setQuantityToTransferPerItem({required int id, int? qty, required double total}) {
    final items = state.stockTransfer.items?.toList() ?? [];

    final updatedItems = items.map((item) {
      if (item.id == id) {
        return item.copyWith(
          nullQtyToTransfer: qty == null,
          qtyToTransfer: qty,
          total: total.roundToTwoDecimalPlaces(),
        );
      }
      return item;
    }).toList();

    emit(StockTransferState(state.stockTransfer.copyWith(items: updatedItems)));
  }

  void setQuantityReceivedPerItem({required int id, int? qty, required double total}) {
    final items = state.stockTransfer.items?.toList() ?? [];

    final updatedItems = items.map((item) {
      if (item.id == id) {
        return item.copyWith(
          nullQtyReceived: qty == null,
          qtyReceived: qty,
          total: total.roundToTwoDecimalPlaces(),
        );
      }
      return item;
    }).toList();

    emit(StockTransferState(state.stockTransfer.copyWith(items: updatedItems)));
  }

  void addItem(StockTransferItem value) {
    final stockTransferItems = state.stockTransfer.items?.toList() ?? [];
    final updatedStockTransferItems = [...stockTransferItems, value];

    emit(StockTransferState(state.stockTransfer.copyWith(items: updatedStockTransferItems)));
  }

  void removeItem(int id) {
    final stockTransferItems = state.stockTransfer.items?.toList() ?? [];
    stockTransferItems.removeWhere((variant) => variant.id == id);

    emit(StockTransferState(state.stockTransfer.copyWith(items: stockTransferItems)));
  }

  void setNotes(String value) => emit(StockTransferState(state.stockTransfer.copyWith(notes: value)));
}
