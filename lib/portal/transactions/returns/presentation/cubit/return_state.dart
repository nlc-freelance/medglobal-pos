part of 'return_cubit.dart';

// class ReturnState extends Equatable {
//   const ReturnState(this.transaction);

//   final Transaction transaction;

//   @override
//   List<Object> get props => [transaction];

//   factory ReturnState.initial() => const ReturnState(Transaction());
// }

@freezed
class ReturnState with _$ReturnState {
  const factory ReturnState({
    @Default([]) List<TransactionItem> items,
  }) = _ReturnState;

  factory ReturnState.initial() => const ReturnState();

  factory ReturnState.fromTransactionItems(List<TransactionItem> items) => ReturnState(
        items: items,
      );
}
