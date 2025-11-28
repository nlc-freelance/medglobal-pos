import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';

part 'receipt_template_form_state.dart';
part 'receipt_template_form_cubit.freezed.dart';

class ReceiptTemplateFormCubit extends Cubit<ReceiptTemplateFormState> {
  ReceiptTemplateFormCubit() : super(ReceiptTemplateFormState.initial());

  void loadReceiptTemplate(ReceiptTemplate template) {
    emit(ReceiptTemplateFormState.load(template));
  }

  void setName(String name) => emit(state.copyWith(name: name));

  void setDescription(String description) => emit(state.copyWith(description: description));

  void setIsDefault(bool isDefault) => emit(state.copyWith(isDefault: isDefault));

  void emitWithValidation(ReceiptTemplateFormState state) {
    emit(state.copyWith(isConfigurationValid: state.hasValidConfiguration()));
  }

  void setShowCompanyName(bool showCompanyName) {
    emitWithValidation(state.copyWith(showCompanyName: showCompanyName));
  }

  void setShowBranchName(bool showBranchName) {
    emitWithValidation(state.copyWith(showBranchName: showBranchName));
  }

  void setShowBranchAddress(bool showBranchAddress) =>
      emitWithValidation(state.copyWith(showBranchAddress: showBranchAddress));

  void setShowBranchContactDetails(bool showBranchContact) =>
      emitWithValidation(state.copyWith(showBranchContact: showBranchContact));

  void setShowFooterMessage(bool showFooterMessage) =>
      emitWithValidation(state.copyWith(showFooterMessage: showFooterMessage));

  void setFooterTitle(String footerTitle) => emit(state.copyWith(footerTitle: footerTitle));

  void setFooterMessage(String footerMessage) => emit(state.copyWith(footerMessage: footerMessage));

  void validateConfiguration() {
    emit(state.copyWith(isConfigurationValid: state.hasValidConfiguration()));
  }
}
