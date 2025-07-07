part of 'sales_per_shift_list_cubit.dart';

sealed class SalesPerShiftListState extends Equatable {
  const SalesPerShiftListState();

  @override
  List<Object> get props => [];
}

final class SalesPerShiftListInitial extends SalesPerShiftListState {}

final class SalesPerShiftListLoading extends SalesPerShiftListState {}

final class SalesPerShiftListLoaded extends SalesPerShiftListState {
  final SalesPerShiftPaginatedList data;
  const SalesPerShiftListLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

final class SalesPerShiftListError extends SalesPerShiftListState {
  final String message;
  const SalesPerShiftListError({required this.message});

  @override
  List<Object> get props => [message];
}
