import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';

part 'return_state.dart';

class ReturnCubit extends Cubit<ReturnState> {
  ReturnCubit() : super(ReturnState.initial());

  void setReturn(Transaction transaction) => emit(ReturnState(transaction));

  void setReturnItemWriteOffQty({required int id, int? writeOffQty}) {
    final returnItems = state.transaction.items?.toList() ?? [];
    final updatedReturnItems = returnItems.map((item) {
      if (item.id == id) return item.copyWith(writeOffQty: writeOffQty);
      return item;
    }).toList();

    emit(ReturnState(state.transaction.copyWith(items: updatedReturnItems)));
  }

  void setReturnItemRestockQty({required int id, int? restockQty}) {
    final returnItems = state.transaction.items?.toList() ?? [];
    final updatedReturnItems = returnItems.map((item) {
      if (item.id == id) return item.copyWith(restockQty: restockQty);
      return item;
    }).toList();

    emit(ReturnState(state.transaction.copyWith(items: updatedReturnItems)));
  }

  void setReturnItemComment({required int id, String? comment}) {
    final returnItems = state.transaction.items?.toList() ?? [];
    final updatedReturnItems = returnItems.map((item) {
      if (item.id == id) return item.copyWith(comment: comment);
      return item;
    }).toList();

    emit(ReturnState(state.transaction.copyWith(items: updatedReturnItems)));
  }
}
