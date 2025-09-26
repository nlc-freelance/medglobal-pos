part of 'refund_bloc.dart';

@freezed
class RefundEvent with _$RefundEvent {
  const factory RefundEvent.createRefund({
    required Transaction saleTransaction,
    required String? reasonForRefund,
    required List<RefundItem> items,
  }) = _CreateRefund;
  const factory RefundEvent.reset() = _Reset;
}
