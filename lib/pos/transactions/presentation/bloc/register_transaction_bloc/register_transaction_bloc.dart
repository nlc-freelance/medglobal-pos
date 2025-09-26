import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/transactions/register_transaction_repository.dart';

part 'register_transaction_event.dart';
part 'register_transaction_state.dart';
part 'register_transaction_bloc.freezed.dart';

class RegisterTransactionBloc extends Bloc<RegisterTransactionEvent, RegisterTransactionState> {
  final RegisterTransactionRepository _repository;

  RegisterTransactionBloc(this._repository) : super(const RegisterTransactionState.initial()) {
    on<_GetTransactionById>(_onGetTransactionById);
    // on<_Reset>(_onReset);
  }

  Future<void> _onGetTransactionById(event, emit) async {
    emit(const RegisterTransactionState.loading());

    try {
      final result = await _repository.getTransactionById(event.id);
      result.fold(
        (failure) => emit(RegisterTransactionState.failure(failure.message)),
        (transaction) => emit(RegisterTransactionState.loaded(transaction)),
      );
    } catch (e) {
      emit(RegisterTransactionState.failure(e.toString()));
    }
  }

  // void _onReset(_Reset event, Emitter<RegisterTransactionState> emit) => emit(const RegisterTransactionState.initial());
}
