part of 'receipt_template_form_cubit.dart';

@freezed
class ReceiptTemplateFormState with _$ReceiptTemplateFormState {
  const factory ReceiptTemplateFormState({
    int? id,
    String? name,
    String? description,
    @Default(false) bool isSystemDefault,
    @Default(false) bool isDefault,
    @Default(false) bool showCompanyName,
    @Default(false) bool showBranchName,
    @Default(false) bool showBranchAddress,
    @Default(false) bool showBranchContact,
    @Default(false) bool showFooterMessage,
    String? footerTitle,
    String? footerMessage,
    @Default(true) bool isConfigurationValid,
  }) = _ReceiptTemplateFormState;

  const ReceiptTemplateFormState._();

  factory ReceiptTemplateFormState.initial() => const ReceiptTemplateFormState();

  factory ReceiptTemplateFormState.fromTax(ReceiptTemplate template) => ReceiptTemplateFormState(
        id: template.id,
        name: template.name,
        description: template.description,
        isSystemDefault: template.isSystemDefault,
        isDefault: template.isDefault,
        showCompanyName: template.showCompanyName,
        showBranchName: template.showBranchName,
        showBranchAddress: template.showBranchAddress,
        showBranchContact: template.showBranchContact,
        showFooterMessage: template.showFooterMessage,
        footerTitle: template.footerTitle,
        footerMessage: template.footerMessage,
      );

  bool hasValidConfiguration() =>
      showCompanyName || showBranchName || showBranchAddress || showBranchContact || showFooterMessage;
}
