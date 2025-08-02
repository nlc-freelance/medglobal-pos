import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/transaction_repository.dart';

part 'pos_transaction_event.dart';
part 'pos_transaction_state.dart';
part 'pos_transaction_bloc.freezed.dart';

class PosTransactionBloc extends Bloc<PosTransactionEvent, PosTransactionState> {
  final TransactionRepository _repository;

  PosTransactionBloc(this._repository) : super(const PosTransactionState.initial()) {
    on<_GetTransactionById>(_onGetTransactionById);
  }

  Future<void> _onGetTransactionById(event, emit) async {
    emit(const PosTransactionState.loading());

    try {
      final result = await _repository.getTransactionById(event.id);
      result.fold(
        (failure) => emit(PosTransactionState.failure(failure.message)),
        (transaction) => emit(PosTransactionState.loaded(transaction)),
      );
    } catch (e) {
      emit(PosTransactionState.failure(e.toString()));
    }
  }
}
