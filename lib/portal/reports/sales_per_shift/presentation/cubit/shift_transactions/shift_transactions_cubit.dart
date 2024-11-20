import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/transactions/domain/entities/transaction_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/transactions/domain/usecases/get_transactions_usecase.dart';

part 'shift_transactions_state.dart';

class ShiftTransactionsCubit extends Cubit<ShiftTransactionsState> {
  final GetTransactionsUseCase _getTransactionsUseCase;

  ShiftTransactionsCubit(this._getTransactionsUseCase) : super(ShiftTransactionsInitial());

  Future<void> getTransactions({
    int page = 1,
    int size = 20,
    required int shiftId,
  }) async {
    emit(ShiftTransactionsLoading());

    try {
      final result = await _getTransactionsUseCase.call(GetTransactionsParams(
        page: page,
        size: size,
        shiftId: shiftId,
      ));
      result.fold(
        (error) => emit(ShiftTransactionsError(message: error.message)),
        (data) => emit(ShiftTransactionsLoaded(data: data)),
      );
    } catch (e) {
      emit(ShiftTransactionsError(message: e.toString()));
    }
  }
}
