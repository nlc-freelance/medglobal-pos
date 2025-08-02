part of 'return_remote_cubit.dart';

sealed class ReturnRemoteState extends Equatable {
  const ReturnRemoteState();

  @override
  List<Object> get props => [];
}

final class ReturnInitial extends ReturnRemoteState {}

final class ReturnLoading extends ReturnRemoteState {}

final class ReturnSuccess extends ReturnRemoteState {
  final Transaction transaction;
  const ReturnSuccess({required this.transaction});

  @override
  List<Object> get props => [transaction];
}

final class ReturnError extends ReturnRemoteState {
  final String message;
  const ReturnError({required this.message});

  @override
  List<Object> get props => [message];
}
