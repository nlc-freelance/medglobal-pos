part of 'refund_remote_cubit.dart';

sealed class RefundRemoteState extends Equatable {
  const RefundRemoteState();

  @override
  List<Object> get props => [];
}

final class RefundInitial extends RefundRemoteState {}

final class RefundLoading extends RefundRemoteState {}

final class RefundSuccess extends RefundRemoteState {
  final Transaction refund;
  const RefundSuccess({required this.refund});

  @override
  List<Object> get props => [refund];
}

final class RefundError extends RefundRemoteState {
  final String message;
  const RefundError({required this.message});

  @override
  List<Object> get props => [message];
}
