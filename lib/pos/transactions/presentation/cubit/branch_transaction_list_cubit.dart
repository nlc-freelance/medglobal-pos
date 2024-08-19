import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/transactions/domain/usecases/get_transactions_usecase.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';

part 'branch_transaction_list_state.dart';

/// Get transactions by branch which the current user is assigned to.
/// Use to render lazy load transactions.
class BranchTransactionListCubit extends Cubit<BranchTransactionListState> {
  final GetTransactionsUseCase _getTransactionsUseCase;

  BranchTransactionListCubit(this._getTransactionsUseCase) : super(BranchTransactionListInitial());

  int _currentPage = 1;
  Set<Transaction> _transactions = {};

  Future<void> getTransactionsByBranch({String? search, bool isInitialSearch = false}) async {
    if (isInitialSearch) {
      _transactions = {};
      _currentPage = 1;
    }

    if (_currentPage == 1) emit(BranchTransactionListLoading());

    try {
      final result = await _getTransactionsUseCase.call(GetTransactionsParams(page: _currentPage, size: 10));
      result.fold(
        (error) => emit(BranchTransactionListError(message: error.message)),
        (transactions) {
          _currentPage++;
          _transactions = {..._transactions, ...?transactions.transactions};

          emit(BranchTransactionListLoaded(
            transactions: _transactions.toList(),
            hasReachedMax: transactions.currentPage == transactions.totalPages,
          ));
        },
      );
    } catch (e) {
      emit(BranchTransactionListError(message: e.toString()));
    }
  }

  void reset() {
    _transactions = {};
    _currentPage = 1;
    emit(BranchTransactionListInitial());
  }
}
