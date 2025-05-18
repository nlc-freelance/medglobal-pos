import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';

part 'receipt_template_form_state.dart';
part 'receipt_template_form_cubit.freezed.dart';

class ReceiptTemplateFormCubit extends Cubit<ReceiptTemplateFormState> {
  ReceiptTemplateFormCubit() : super(ReceiptTemplateFormState.initial());

  void initReceiptTemplate(ReceiptTemplate template) {
    emit(ReceiptTemplateFormState.fromTax(template));
  }

  void setName(String name) => emit(state.copyWith(name: name));

  void setDescription(String description) => emit(state.copyWith(description: description));

  void setIsDefault(bool isDefault) => emit(state.copyWith(isDefault: isDefault));

  void setShowCompanyName(bool showCompanyName) => emit(state.copyWith(showCompanyName: showCompanyName));

  void setShowBranchName(bool showBranchName) => emit(state.copyWith(showBranchName: showBranchName));

  void setShowBranchAddress(bool showBranchAddress) => emit(state.copyWith(showBranchAddress: showBranchAddress));

  void setShowBranchContactDetails(bool showBranchContactDetails) =>
      emit(state.copyWith(showBranchContactDetails: showBranchContactDetails));

  void setShowFooterMessage(bool showFooterMessage) => emit(state.copyWith(showFooterMessage: showFooterMessage));

  void setFooterTitle(String footerTitle) => emit(state.copyWith(footerTitle: footerTitle));

  void setFooterMessage(String footerMessage) => emit(state.copyWith(footerMessage: footerMessage));

  /// Given that the form is validated, map ReceiptTemplateFormState values to a ReceiptTemplate
  ReceiptTemplate toReceiptTemplate() {
    return ReceiptTemplate(
      id: state.id,
      name: state.name!,
      description: state.description,
      isDefault: state.isDefault,
      showCompanyName: state.showCompanyName,
      showBranchName: state.showBranchName,
      showBranchAddress: state.showBranchAddress,
      showBranchContactDetails: state.showBranchContactDetails,
      showFooterMessage: state.showFooterMessage,
      footerTitle: state.footerTitle,
      footerMessage: state.footerMessage,
    );
  }
}
