part of 'shift_transactions_cubit.dart';

sealed class ShiftTransactionsState extends Equatable {
  const ShiftTransactionsState();
  @override
  List<Object> get props => [];
}

final class ShiftTransactionsInitial extends ShiftTransactionsState {}

final class ShiftTransactionsLoading extends ShiftTransactionsState {}

final class ShiftTransactionsLoaded extends ShiftTransactionsState {
  final PaginatedList<Transaction> data;
  const ShiftTransactionsLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

final class ShiftTransactionsError extends ShiftTransactionsState {
  final String message;
  const ShiftTransactionsError({required this.message});

  @override
  List<Object> get props => [message];
}
