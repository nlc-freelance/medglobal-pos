import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/domain/usecases/get_transactions_usecase.dart';

part 'transaction_list_state.dart';

class TransactionListCubit extends Cubit<TransactionListState> {
  final GetTransactionsUseCase _getTransactionsUseCase;

  TransactionListCubit(this._getTransactionsUseCase) : super(TransactionListInitial());

  Future<void> getTransactions({int? page, int? registerId, int? branchId}) async {
    emit(TransactionListLoading());

    try {
      final result = await _getTransactionsUseCase.call(GetTransactionsParams(
        page: page,
        registerId: registerId,
        branchId: branchId,
      ));
      result.fold(
        (error) => emit(TransactionListError(message: error.message)),
        (data) => emit(TransactionListLoaded(transactions: data.transactions!)),
      );
    } catch (e) {
      emit(TransactionListError(message: e.toString()));
    }
  }
}
