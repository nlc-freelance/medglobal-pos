import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/transactions/domain/entities/transaction_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/transactions/domain/usecases/get_transactions_usecase.dart';

part 'return_transaction_list_state.dart';

class ReturnTransactionListCubit extends Cubit<ReturnTransactionListState> {
  final GetTransactionsUseCase _getTransactionsUseCase;

  ReturnTransactionListCubit(this._getTransactionsUseCase) : super(ReturnTransactionListInitial());

  Future<void> getTransactions({int page = 1, int size = 20, int? branchId, String? startDate, String? endDate,}) async {
    emit(ReturnTransactionListLoading());

    try {
      final result = await _getTransactionsUseCase.call(GetTransactionsParams(
        type: TransactionType.REFUND,
        page: page,
        size: size,
        branchId: branchId,
        isAllBranches: branchId == null,
        startDate: startDate,
        endDate: endDate,
      ));
      result.fold(
        (error) => emit(ReturnTransactionListError(message: error.message)),
        (data) {
          emit(ReturnTransactionListLoaded(data: data));
        },
      );
    } catch (e) {
      emit(ReturnTransactionListError(message: e.toString()));
    }
  }
}
