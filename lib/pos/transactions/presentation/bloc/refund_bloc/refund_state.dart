part of 'refund_bloc.dart';

@freezed
class RefundState with _$RefundState {
  const factory RefundState.initial() = _Initial;
  const factory RefundState.processing() = _Processing;
  const factory RefundState.success(Transaction refund) = _Success;
  const factory RefundState.failure(String message) = _Failure;
}
