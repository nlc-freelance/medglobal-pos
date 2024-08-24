import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/domain/usecases/update_return_transaction_usecase.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';

part 'return_remote_state.dart';

class ReturnRemoteCubit extends Cubit<ReturnRemoteState> {
  final UpdateReturnTransactionUseCase _UpdateReturnTransactionUseCase;

  ReturnRemoteCubit(this._UpdateReturnTransactionUseCase) : super(ReturnInitial());

  void reset() => emit(ReturnInitial());

  Future<void> processReturn(Transaction value) async {
    emit(ReturnLoading());

    try {
      final result = await _UpdateReturnTransactionUseCase.call(UpdateReturnTransactionParams(value));
      result.fold(
        (error) => emit(ReturnError(message: error.message)),
        (transaction) => emit(ReturnSuccess(transaction: transaction)),
      );
    } catch (e) {
      emit(ReturnError(message: e.toString()));
    }
  }
}
