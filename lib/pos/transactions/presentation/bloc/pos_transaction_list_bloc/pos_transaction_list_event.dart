part of 'pos_transaction_list_bloc.dart';

@freezed
class PosTransactionListEvent with _$PosTransactionListEvent {
  /// Gets all transactions from the branch the current user is assigned to
  const factory PosTransactionListEvent.fetch({String? search}) = _Fetch;
  const factory PosTransactionListEvent.addTransactionToList(Transaction transaction) = _AddTransactionToList;
  const factory PosTransactionListEvent.reset() = _Reset;
}
