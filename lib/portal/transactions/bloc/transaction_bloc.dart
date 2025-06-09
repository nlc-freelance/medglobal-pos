import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/transaction_repository.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';
part 'transaction_bloc.freezed.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository _repository;

  TransactionBloc(this._repository) : super(const TransactionState.initial()) {
    on<_GetTransactionById>(_onGetTransactionById);
  }

  Future<void> _onGetTransactionById(event, emit) async {
    emit(const TransactionState.loading());

    try {
      final result = await _repository.getTransactionById(event.id);
      result.fold(
        (failure) => emit(TransactionState.failure(failure.message)),
        (transaction) => emit(TransactionState.loaded(transaction)),
      );
    } catch (e) {
      emit(TransactionState.failure(e.toString()));
    }
  }
}
