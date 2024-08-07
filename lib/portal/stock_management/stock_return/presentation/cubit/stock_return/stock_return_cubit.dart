import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return_item.dart';

part 'stock_return_state.dart';

class StockReturnCubit extends Cubit<StockReturnState> {
  StockReturnCubit() : super(StockReturnState.initial());

  void reset() => emit(StockReturnState.initial());

  void setStockReturn(StockReturn stockReturn) => emit(StockReturnState(stockReturn));

  void setQuantityToReturnPerItem({required int id, required int qty, required double total}) {
    final items = state.stockReturn.items?.toList() ?? [];

    final updatedItems = items.map((item) {
      if (item.id == id) return item.copyWith(qtyToReturn: qty, total: total);
      return item;
    }).toList();

    emit(StockReturnState(state.stockReturn.copyWith(items: updatedItems)));
  }

  void setSupplierPricePerItem({required int id, required double price, required double total}) {
    final items = state.stockReturn.items?.toList() ?? [];

    final updatedItems = items.map((item) {
      if (item.id == id) return item.copyWith(supplierPrice: price, total: total);
      return item;
    }).toList();

    emit(StockReturnState(state.stockReturn.copyWith(items: updatedItems)));
  }

  void addItem(StockReturnItem value) {
    final stockReturnItems = state.stockReturn.items?.toList() ?? [];
    final updatedStockReturnItems = [...stockReturnItems, value];

    emit(StockReturnState(state.stockReturn.copyWith(items: updatedStockReturnItems)));
  }

  void removeItem(int id) {
    final stockReturnItems = state.stockReturn.items?.toList() ?? [];
    stockReturnItems.removeWhere((variant) => variant.id == id);

    emit(StockReturnState(state.stockReturn.copyWith(items: stockReturnItems)));
  }

  void setTax(double value) => emit(StockReturnState(state.stockReturn.copyWith(tax: value)));

  void setDisount(double value) => emit(StockReturnState(state.stockReturn.copyWith(discount: value)));

  void setTotal(double value) => emit(StockReturnState(state.stockReturn.copyWith(totalAmount: value)));

  void setNotes(String value) => emit(StockReturnState(state.stockReturn.copyWith(notes: value)));
}
