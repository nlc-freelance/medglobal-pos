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
            state.isSystemDefault
                ? const PageSectionTitle(title: 'Configuration')
                : PageSectionTitle.subsection(
                    title: 'Configuration',
                    subtitle: 'The following details can be shown or hidden on the receipt.',
                  ),
            if (!state.isConfigurationValid)
              UIText.dataGridText(
                'Please add configuration for this template.',
                color: UIColors.buttonDanger,
              ),
            SizedBox(
              width: 500,
              child: IgnorePointer(
                ignoring: state.isSystemDefault,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // AppCheckboxListTile(
                    //   label: 'Show Company Name',
                    //   controlAffinity: ListTileControlAffinity.trailing,
                    //   value: state.showCompanyName,
                    //   onToggle: (value) => _receiptTemplateFormCubit.setShowCompanyName(value),
                    // ),
                    // const UIVerticalSpace(16),
                    AppCheckboxListTile(
                      label: 'Show Branch Name',
                      controlAffinity: ListTileControlAffinity.trailing,
                      value: state.showBranchName,
                      onToggle: (value) => _receiptTemplateFormCubit.setShowBranchName(value),
                    ),
                    const UIVerticalSpace(16),
                    // AppCheckboxListTile(
                    //   label: 'Show Branch Address',
                    //   controlAffinity: ListTileControlAffinity.trailing,
                    //   value: state.showBranchAddress,
                    //   onToggle: (value) => _receiptTemplateFormCubit.setShowBranchAddress(value),
                    // ),
                    // const UIVerticalSpace(16),
                    AppCheckboxListTile(
                      label: 'Show Branch Contact',
                      controlAffinity: ListTileControlAffinity.trailing,
                      value: state.showBranchContact,
                      onToggle: (value) => _receiptTemplateFormCubit.setShowBranchContactDetails(value),
                    ),
                    const UIVerticalSpace(16),
                    AppCheckboxListTile(
                      label: 'Show Footer Message',
                      value: state.showFooterMessage,
                      controlAffinity: ListTileControlAffinity.trailing,
                      onToggle: (value) => _receiptTemplateFormCubit.setShowFooterMessage(value),
                    ),
                    const UIVerticalSpace(16),
                    if (state.isSystemDefault) ...[
                      LabelValue.text(label: 'Footer Title', value: state.footerTitle),
                      const UIVerticalSpace(16),
                      LabelValue.text(label: 'Footer Message', value: state.footerMessage),
                    ] else if (state.showFooterMessage) ...[
                      AppTextFormField.top(
                        label: 'Title',
                        hint: 'Enter footer message title',
                        controller: _footerTitleController,
                        isRequired: true,
                        validator: FormValidators.required('Please enter a footer message title.'),
                        onChanged: (value) => _receiptTemplateFormCubit.setFooterTitle(value),
                      ),
                      const UIVerticalSpace(16),
                      AppTextFormField.top(
                        label: 'Messsage',
                        hint: 'Enter footer message',
                        controller: _footerMessageController,
                        onChanged: (value) => _receiptTemplateFormCubit.setFooterMessage(value),
                      ),
                    ],
                  ],
                ),
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
