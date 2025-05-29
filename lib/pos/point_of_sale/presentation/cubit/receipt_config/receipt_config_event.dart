part of 'receipt_config_bloc.dart';

@freezed
class ReceiptConfigEvent with _$ReceiptConfigEvent {
  const factory ReceiptConfigEvent.getReceiptConfigByBranchId(int id) = _GetReceiptConfigByBranchId;
}
