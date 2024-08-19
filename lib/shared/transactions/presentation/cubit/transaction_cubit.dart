import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/transactions/domain/usecases/get_transaction_by_id_usecase.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final GetTransactionByIdUseCase _getTransactionByIdUseCase;

  TransactionCubit(this._getTransactionByIdUseCase) : super(TransactionInitial());

  Future<void> getTransactionById(int id) async {
    emit(TransactionByIdLoading());

    try {
      final result = await _getTransactionByIdUseCase.call(GetTransactionByIdParams(id));
      result.fold(
        (error) => emit(TransactionByIdError(message: error.message)),
        (data) => emit(TransactionByIdSuccess(transaction: data)),
      );
    } catch (e) {
      emit(TransactionByIdError(message: e.toString()));
    }
  }
}
