import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/transactions/domain/entities/transaction_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/transactions/domain/usecases/get_transactions_usecase.dart';

part 'sale_transaction_list_state.dart';

class SaleTransactionListCubit extends Cubit<SaleTransactionListState> {
  final GetTransactionsUseCase _getTransactionsUseCase;

  SaleTransactionListCubit(this._getTransactionsUseCase) : super(SaleTransactionListInitial());

  Future<void> getTransactions({int page = 1, int size = 20, int? registerId, int? branchId}) async {
    emit(SaleTransactionListLoading());

    try {
      final result = await _getTransactionsUseCase.call(GetTransactionsParams(
        type: TransactionType.SALE,
        page: page,
        size: size,
        registerId: registerId,
        branchId: branchId,
      ));
      result.fold(
        (error) => emit(SaleTransactionListError(message: error.message)),
        (data) {
          emit(SaleTransactionListLoaded(data: data));
        },
      );
    } catch (e) {
      emit(SaleTransactionListError(message: e.toString()));
    }
  }
}
