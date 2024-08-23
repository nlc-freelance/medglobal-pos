part of 'sale_remote_cubit.dart';

sealed class SaleRemoteState extends Equatable {
  const SaleRemoteState();

  @override
  List<Object> get props => [];
}

final class SaleInitial extends SaleRemoteState {}

final class SaleLoading extends SaleRemoteState {}

final class SaleSuccess extends SaleRemoteState {
  final Transaction transaction;
  const SaleSuccess({required this.transaction});

  @override
  List<Object> get props => [transaction];
}

final class SaleError extends SaleRemoteState {
  final String message;
  const SaleError({required this.message});

  @override
  List<Object> get props => [message];
}
