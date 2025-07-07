part of 'sales_per_shift_cubit.dart';

sealed class SalesPerShiftState extends Equatable {
  const SalesPerShiftState();

  @override
  List<Object> get props => [];
}

final class SalesPerShiftInitial extends SalesPerShiftState {}

final class SalesPerShiftLoading extends SalesPerShiftState {}

final class SalesPerShiftLoaded extends SalesPerShiftState {
  final SalesPerShiftDetails salesPerShift;
  const SalesPerShiftLoaded({required this.salesPerShift});

  @override
  List<Object> get props => [salesPerShift];
}

final class SalesPerShiftError extends SalesPerShiftState {
  final String message;
  const SalesPerShiftError({required this.message});

  @override
  List<Object> get props => [message];
}
