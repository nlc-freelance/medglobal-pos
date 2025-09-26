part of 'transaction_list_bloc.dart';

@freezed
class TransactionListEvent with _$TransactionListEvent {
  const factory TransactionListEvent.fetch({String? search}) = _Fetch;
  const factory TransactionListEvent.insertNewTransaction(Transaction transaction) = _InsertNewTransaction;
  const factory TransactionListEvent.reset() = _Reset;
}
