part of 'refund_cubit.dart';

class RefundState extends Equatable {
  const RefundState(this.refund);

  final Transaction refund;

  @override
  List<Object> get props => [refund];

  factory RefundState.initial() => const RefundState(Transaction());
}
