import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/portal/transactions/repositories/transaction_repository.dart';

part 'shift_transactions_state.dart';

class ShiftTransactionsCubit extends Cubit<ShiftTransactionsState> {
  final TransactionRepository _repository;

  ShiftTransactionsCubit(this._repository) : super(ShiftTransactionsInitial());

  Future<void> getTransactions({
    int page = 1,
    int size = 20,
    required int shiftId,
  }) async {
    emit(ShiftTransactionsLoading());

    try {
      final result = await _repository.getTransactions(
        page: page,
        size: size,
        shift: shiftId,
      );
      result.when(
        success: (data) => emit(ShiftTransactionsLoaded(data: data)),
        failure: (error) => emit(ShiftTransactionsError(message: error.message)),
      );
    } catch (e) {
      emit(ShiftTransactionsError(message: e.toString()));
    }
  }
}
