part of 'receipt_template_bloc.dart';

@freezed
class ReceiptTemplateState with _$ReceiptTemplateState {
  const factory ReceiptTemplateState.initial() = _Initial;
  const factory ReceiptTemplateState.loading() = _Loading;
  const factory ReceiptTemplateState.loaded(ReceiptTemplate template) = _Loaded;
  const factory ReceiptTemplateState.loadFailed(String message) = _LoadFailed;
  const factory ReceiptTemplateState.processing() = _Processing;
  const factory ReceiptTemplateState.success(String message) = _Success;
  const factory ReceiptTemplateState.failure(String message) = _Failure;
}
