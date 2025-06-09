part of 'refund_form_cubit.dart';

// class RefundState extends Equatable {
//   const RefundState(this.refund);

//   final Transaction refund;

//   @override
//   List<Object> get props => [refund];

//   factory RefundState.initial() => const RefundState(Transaction());
// }

@freezed
class RefundFormState with _$RefundFormState {
  const factory RefundFormState({
    @Default([]) List<RefundItem> items,
    String? reasonForRefund,
  }) = _RefundFormState;

  factory RefundFormState.initial() => const RefundFormState();

  // factory RefundState.fromTransactionItems(List<TransactionItem> items) => RefundState(
  //       items: items,
  //     );
}
