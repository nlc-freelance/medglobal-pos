import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';

import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/portal/transactions/repositories/transaction_repository.dart';

part 'return_transaction_list_state.dart';

class ReturnTransactionListCubit extends Cubit<ReturnTransactionListState> {
  final TransactionRepository _repository;
  ReturnTransactionListCubit(this._repository) : super(ReturnTransactionListInitial());

  Future<void> getTransactions({
    int page = 1,
    int size = 20,
    String? search,
    int? branchId,
    String? startDate,
    String? endDate,
  }) async {
    emit(ReturnTransactionListLoading());

    try {
      final result = await _repository.getTransactions(
        type: TransactionType.refund,
        page: page,
        size: size,
        search: search,
        branch: branchId,
        isAllBranches: branchId == null,
        startDate: startDate,
        endDate: endDate,
      );
      result.when(
        success: (data) {
          if (search != null && data.totalCount == 0 && data.items.isEmpty == true) {
            emit(ReturnTransactionSearchNoResult(message: 'No results found for \'$search\''));
          } else {
            emit(ReturnTransactionListLoaded(data: data));
          }
        },
        failure: (error) => emit(ReturnTransactionListError(message: error.message)),
      );
    } catch (e) {
      emit(ReturnTransactionListError(message: e.toString()));
    }
  }
}
