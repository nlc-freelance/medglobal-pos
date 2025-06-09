part of 'pos_transaction_list_bloc.dart';

@freezed
class PosTransactionListState with _$PosTransactionListState {
  const factory PosTransactionListState({
    required List<Transaction> transactions,
    required bool hasReachedMax,
    required bool hasNoData,
    required bool isLoadingInitial,
    required bool isLoadingMore,
    String? error,
  }) = _PosTransactionListState;

  factory PosTransactionListState.initial() => const PosTransactionListState(
        transactions: [],
        hasReachedMax: false,
        hasNoData: false,
        isLoadingInitial: false,
        isLoadingMore: false,
        error: null,
      );
}
