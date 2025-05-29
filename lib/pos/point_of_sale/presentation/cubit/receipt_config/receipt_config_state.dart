part of 'receipt_config_bloc.dart';

@freezed
class ReceiptConfigState with _$ReceiptConfigState {
  const factory ReceiptConfigState.initial() = _Initial;
  const factory ReceiptConfigState.loading() = _Loading;
  const factory ReceiptConfigState.loaded(ReceiptConfig config) = _Loaded;
  const factory ReceiptConfigState.failure(String message) = _Failure;
}
