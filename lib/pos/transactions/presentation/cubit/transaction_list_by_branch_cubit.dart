import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/transactions/domain/usecases/get_transactions_usecase.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';

part 'transaction_list_by_branch_state.dart';

/// Get transactions by branch which the current user is assigned to.
/// Use to render lazy load transactions.
class TransactionListByBranchCubit extends Cubit<TransactionListByBranchState> {
  final GetTransactionsUseCase _getTransactionsUseCase;

  TransactionListByBranchCubit(this._getTransactionsUseCase) : super(TransactionListByBranchState.initial());

  int _currentPage = 1;
  Set<Transaction> _transactions = {};

  void reset() {
    _transactions = {};
    _currentPage = 1;
    emit(TransactionListByBranchState.initial());
  }

  void addNewTransactionToList(Transaction newTransaction) {
    if (_transactions.isNotEmpty) {
      _transactions = {..._transactions, newTransaction};
      emit(state.copyWith(transactions: _transactions.toList()));
    }
  }

  Future<void> getTransactionsByBranch({String? search, bool isInitialSearch = false}) async {
    if (isInitialSearch) {
      _transactions = {};
      _currentPage = 1;
    }

    if (_currentPage == 1) {
      emit(state.copyWith(isInitLoading: true));
    } else {
      emit(state.copyWith(isLoadingMore: true));
    }

    try {
      final result = await _getTransactionsUseCase.call(GetTransactionsParams(page: _currentPage, size: 20));
      result.fold(
        (error) => emit(state.copyWith(isInitLoading: false, isLoadingMore: false, error: error.message)),
        (data) {
          _currentPage++;
          _transactions = {..._transactions, ...?data.transactions};
          emit(state.copyWith(
            isInitLoading: false,
            isLoadingMore: false,
            transactions: _transactions.toList(),
            hasNoData: data.totalCount == 0 && data.transactions?.isEmpty == true,
            hasReachedMax: data.currentPage == data.totalPages,
          ));
          // }
        },
      );
    } catch (e) {
      emit(state.copyWith(isInitLoading: false, isLoadingMore: false, error: e.toString()));
    }
  }
}
