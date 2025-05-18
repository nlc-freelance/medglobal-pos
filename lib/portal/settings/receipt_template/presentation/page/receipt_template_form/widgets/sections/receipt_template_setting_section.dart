import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/form_validators.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/presentation/cubit/receipt_template_form_cubit/receipt_template_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ReceiptTemplateSettingSection extends StatefulWidget {
  const ReceiptTemplateSettingSection({super.key});

  @override
  State<ReceiptTemplateSettingSection> createState() => _ReceiptTemplateSettingSectionState();
}

class _ReceiptTemplateSettingSectionState extends State<ReceiptTemplateSettingSection> {
  late ReceiptTemplateFormCubit _receiptTemplateFormCubit;

  late TextEditingController _footerTitleController;
  late TextEditingController _footerMessageController;

  @override
  void initState() {
    super.initState();

    _receiptTemplateFormCubit = context.read<ReceiptTemplateFormCubit>();

    _footerTitleController = TextEditingController(text: _receiptTemplateFormCubit.state.footerTitle);
    _footerMessageController = TextEditingController(text: _receiptTemplateFormCubit.state.footerMessage);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptTemplateFormCubit, ReceiptTemplateFormState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageSectionTitle.subsection(
              title: 'Configuration',
              subtitle: 'The following details can be shown or hidden on the receipt.',
            ),
            SizedBox(
              width: 500,
              child: Column(
                children: [
                  AppCheckboxListTile(
                    label: 'Company Name',
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: state.showCompanyName,
                    onToggle: (value) => _receiptTemplateFormCubit.setIsDefault(value),
                  ),
                  const UIVerticalSpace(16),
                  AppCheckboxListTile(
                    label: 'Branch Name',
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: state.showBranchName,
                    onToggle: (value) => _receiptTemplateFormCubit.setShowBranchName(value),
                  ),
                  const UIVerticalSpace(16),
                  AppCheckboxListTile(
                    label: 'Branch Address',
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: state.showBranchAddress,
                    onToggle: (value) => _receiptTemplateFormCubit.setShowBranchAddress(value),
                  ),
                  const UIVerticalSpace(16),
                  AppCheckboxListTile(
                    label: 'Branch Contact Details',
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: state.showBranchContactDetails,
                    onToggle: (value) => _receiptTemplateFormCubit.setShowBranchContactDetails(value),
                  ),
                  const UIVerticalSpace(16),
                  AppCheckboxListTile(
                    label: 'Footer Message',
                    value: state.showFooterMessage,
                    controlAffinity: ListTileControlAffinity.trailing,
                    onToggle: (value) => _receiptTemplateFormCubit.setShowFooterMessage(value),
                  ),
                  const UIVerticalSpace(16),
                  if (state.showFooterMessage) ...[
                    AppTextFormField.vertical(
                      label: 'Title',
                      hint: 'Enter footer message title',
                      controller: _footerTitleController,
                      isRequired: true,
                      validator: FormValidators.required('Please enter a footer message title.'),
                      onChanged: (value) => _receiptTemplateFormCubit.setFooterTitle(value),
                    ),
                    const UIVerticalSpace(16),
                    AppTextFormField.vertical(
                      label: 'Messsage',
                      hint: 'Enter footer message',
                      controller: _footerMessageController,
                      validator: FormValidators.required('Please enter a footer message.'),
                      onChanged: (value) => _receiptTemplateFormCubit.setFooterMessage(value),
                    ),
                  ],
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _footerTitleController.dispose();
    _footerMessageController.dispose();
    super.dispose();
  }
}
