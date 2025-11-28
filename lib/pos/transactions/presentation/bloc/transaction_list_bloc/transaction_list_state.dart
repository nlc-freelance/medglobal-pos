part of 'transaction_list_bloc.dart';

@freezed
class TransactionListState with _$TransactionListState {
  const factory TransactionListState({
    required List<Transaction> transactions,
    required bool hasReachedEnd,
    required bool isLoadingInitial,
    required bool isLoadingMore,
    @Default(false) newTransactionAdded,
    String? error,
  }) = _PosTransactionListState;

  factory TransactionListState.initial() => const TransactionListState(
        transactions: [],
        hasReachedEnd: false,
        isLoadingInitial: false,
        isLoadingMore: false,
        error: null,
      );
}
