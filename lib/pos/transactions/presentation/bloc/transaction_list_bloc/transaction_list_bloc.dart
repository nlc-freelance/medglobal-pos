import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/portal/transactions/repositories/transaction_repository.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

part 'transaction_list_event.dart';
part 'transaction_list_state.dart';
part 'transaction_list_bloc.freezed.dart';

class TransactionListBloc extends Bloc<TransactionListEvent, TransactionListState> {
  final TransactionRepository _repository;
  // final RegisterTransactionRepository _repository;

  TransactionListBloc(this._repository) : super(TransactionListState.initial()) {
    on<_Fetch>(_onFetch);
    on<_InsertNewTransaction>(_onInsertNewTransaction);
    on<_Reset>(_onReset);
  }

  int _currentPage = 1;
  int _totalCount = -1;
  Set<Transaction> _cachedTransactions = {};
  Set<Transaction> _searchResults = {};

  Future<void> _onFetch(event, emit) async {
    final isSearching = event.search?.isNotEmpty == true;

    if (isSearching || event.forceRefresh) {
      _currentPage = 1;
      _totalCount = -1;
      _cachedTransactions = {};
      // _searchResults = {};
    }

    emit(state.copyWith(
      isLoadingInitial: _currentPage == 1 || isSearching,
      isLoadingMore: _currentPage > 1,
    ));

    try {
      final page = _currentPage;

      final branch = GetIt.I<AppSessionService>().session;

      final result = await _repository.getTransactions(
        page: page,
        size: 20,
        branch: branch?.branchId,
        search: event.search,
      );

      result.when(
        success: (data) {
          // if (isSearching && data.items.isEmpty) {
          // Check if online
          // If online, fetch remotely and store results in _searchResults
          // If offline, show message
          // "Transaction not found. You are currently offline, so only transactions from the past 7 days are available.
          // Please go online to search for transactions older than 7 days."
          // }

          // (isSearching ? _searchResults : _cachedTransactions).addAll(data.items);
          // _totalCount = data.totalCount;
          //
          // final hasReachedEnd = (isSearching ? _searchResults : _cachedTransactions).length == _totalCount;
          //
          // emit(state.copyWith(
          //   transactions: (isSearching ? _searchResults : _cachedTransactions).toList(),
          //   isLoadingInitial: false,
          //   isLoadingMore: false,
          //   hasReachedEnd: hasReachedEnd,
          //   error: null,
          // ));
          //
          // if (!hasReachedEnd) _currentPage++;

          final hasReachedEnd = data.currentPage == data.totalPages;
          _cachedTransactions = {..._cachedTransactions, ...data.items};

          emit(state.copyWith(
            isLoadingInitial: false,
            isLoadingMore: false,
            transactions: _cachedTransactions.toList(),
            hasReachedEnd: hasReachedEnd,
            error: null,
          ));

          if (!hasReachedEnd) _currentPage++;
        },
        failure: (failure) => emit(state.copyWith(
          isLoadingInitial: false,
          isLoadingMore: false,
          error: failure.message,
        )),
      );
    } catch (e) {
      emit(state.copyWith(
        isLoadingInitial: false,
        isLoadingMore: false,
        error: e.toString(),
      ));
    }
  }

  void _onInsertNewTransaction(_InsertNewTransaction event, Emitter<TransactionListState> emit) {
    final updatedList = [event.transaction, ...state.transactions];
    emit(state.copyWith(
      transactions: updatedList,
      newTransactionAdded: true,
    ));
  }

  void _onReset(event, emit) => emit(TransactionListState.initial());
}
