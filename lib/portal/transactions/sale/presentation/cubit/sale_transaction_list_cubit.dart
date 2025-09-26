import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/portal/transactions/repositories/transaction_repository.dart';

part 'sale_transaction_list_state.dart';

class SaleTransactionListCubit extends Cubit<SaleTransactionListState> {
  final TransactionRepository _repository;

  SaleTransactionListCubit(this._repository) : super(SaleTransactionListInitial());

  Future<void> getTransactions({
    int page = 1,
    int size = 20,
    String? search,
    int? branchId,
    String? startDate,
    String? endDate,
  }) async {
    emit(SaleTransactionListLoading());

    try {
      final result = await _repository.getTransactions(
        type: TransactionType.sale,
        page: page,
        size: size,
        search: search,
        branch: branchId,
        isAllBranches: branchId == null,
        startDate: startDate,
        endDate: endDate,
      );
      result.fold(
        (error) => emit(SaleTransactionListError(message: error.message)),
        (data) {
          if (search != null && data.totalCount == 0 && data.items.isEmpty == true) {
            emit(SaleTransactionSearchNoResult(message: 'No results found for \'$search\''));
          } else {
            emit(SaleTransactionListLoaded(data: data));
          }
        },
      );
    } catch (e) {
      emit(SaleTransactionListError(message: e.toString()));
    }
  }
}
