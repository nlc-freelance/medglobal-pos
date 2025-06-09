import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/transaction_repository.dart';

part 'pos_transaction_list_event.dart';
part 'pos_transaction_list_state.dart';
part 'pos_transaction_list_bloc.freezed.dart';

class PosTransactionListBloc extends Bloc<PosTransactionListEvent, PosTransactionListState> {
  final TransactionRepository _repository;

  PosTransactionListBloc(this._repository) : super(PosTransactionListState.initial()) {
    on<_Fetch>(_onFetch);
    on<_AddTransactionToList>(_onAddTransactionToList);
    on<_Reset>(_onReset);
  }

  int _currentPage = 1;

  Future<void> _onFetch(event, emit) async {
    if (state.transactions.isEmpty) {
      emit(state.copyWith(isLoadingInitial: true));
    } else {
      emit(state.copyWith(isLoadingMore: true));
    }

    try {
      final page = event.search?.isNotEmpty == true ? 1 : _currentPage;
      final result = await _repository.getBranchTransactions(
        page: page,
        size: 20,
        search: event.search,
      );

      result.fold(
        (failure) => emit(state.copyWith(
          isLoadingInitial: false,
          isLoadingMore: false,
          error: failure.message,
        )),
        (data) {
          final allTransactions = [...state.transactions, ...data.items];
          emit(state.copyWith(
            transactions: allTransactions,
            isLoadingInitial: false,
            isLoadingMore: false,
            hasReachedMax: data.hasReachedMax,
            hasNoData: data.hasNoItems,
            error: null,
          ));
        },
      );
      _currentPage++;
    } catch (e) {
      emit(state.copyWith(
        isLoadingInitial: false,
        isLoadingMore: false,
        error: e.toString(),
      ));
    }
  }

  void _onAddTransactionToList(event, emit) {
    final updatedList = List<Transaction>.from(state.transactions)..add(event.transaction);
    emit(state.copyWith(transactions: updatedList));
  }

  void _onReset(event, emit) => emit(PosTransactionListState.initial());
}
