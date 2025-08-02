import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction_item.dart';

part 'return_state.dart';
part 'return_cubit.freezed.dart';

class ReturnCubit extends Cubit<ReturnState> {
  ReturnCubit() : super(ReturnState.initial());

  void setReturnItems(List<TransactionItem> items) => emit(ReturnState(items: items));
  // void setReturn(Transaction transaction) => emit(ReturnState(transaction));

  void setReturnItemWriteOffQty({required int id, int? writeOffQty}) {
    final updatedReturnItems = state.items.map((item) {
      if (item.id == id) return item.copyWith(writeOffQty: writeOffQty);
      return item;
    }).toList();

    emit(state.copyWith(items: updatedReturnItems));
  }

  void setReturnItemRestockQty({required int id, int? restockQty}) {
    final updatedReturnItems = state.items.map((item) {
      if (item.id == id) return item.copyWith(restockQty: restockQty);
      return item;
    }).toList();

    emit(state.copyWith(items: updatedReturnItems));
  }

  void setReturnItemComment({required int id, String? comment}) {
    final updatedReturnItems = state.items.map((item) {
      if (item.id == id) return item.copyWith(comment: comment);
      return item;
    }).toList();

    emit(state.copyWith(items: updatedReturnItems));
  }
}
