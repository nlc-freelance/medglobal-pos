part of 'transaction_cubit.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();
  @override
  List<Object> get props => [];
}

final class TransactionInitial extends TransactionState {}

final class TransactionByIdLoading extends TransactionState {}

final class TransactionByIdSuccess extends TransactionState {
  final Transaction transaction;
  const TransactionByIdSuccess({required this.transaction});

  @override
  List<Object> get props => [transaction];
}

final class TransactionByIdError extends TransactionState {
  final String message;
  const TransactionByIdError({required this.message});

  @override
  List<Object> get props => [message];
}
