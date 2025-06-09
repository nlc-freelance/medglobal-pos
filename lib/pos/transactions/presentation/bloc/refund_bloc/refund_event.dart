part of 'refund_bloc.dart';

@freezed
class RefundEvent with _$RefundEvent {
  const factory RefundEvent.createRefund({
    required int registerId,
    required int saleId,
    required List<RefundItem> items,
    String? reasonForRefund,
  }) = _CreateRefund;
  const factory RefundEvent.reset() = _Reset;
}
