part of 'receipt_template_bloc.dart';

@freezed
class ReceiptTemplateEvent with _$ReceiptTemplateEvent {
  const factory ReceiptTemplateEvent.getReceiptTemplateById(int id) = _GetReceiptTemplateById;
  const factory ReceiptTemplateEvent.createReceiptTemplate(ReceiptTemplate template) = _CreateReceiptTemplate;
  const factory ReceiptTemplateEvent.updateReceiptTemplate(ReceiptTemplate template) = _UpdateReceiptTemplate;
  const factory ReceiptTemplateEvent.deleteReceiptTemplate(ReceiptTemplate template) = _DeleteReceiptTemplate;
}
