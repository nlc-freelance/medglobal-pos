part of 'return_cubit.dart';

class ReturnState extends Equatable {
  const ReturnState(this.transaction);

  final Transaction transaction;

  @override
  List<Object> get props => [transaction];

  factory ReturnState.initial() => const ReturnState(Transaction());
}
