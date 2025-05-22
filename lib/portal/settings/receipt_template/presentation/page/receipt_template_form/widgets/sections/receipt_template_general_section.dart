import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/form_validators.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/presentation/cubit/receipt_template_form_cubit/receipt_template_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ReceiptTemplateGeneralSection extends StatefulWidget {
  const ReceiptTemplateGeneralSection({super.key});

  @override
  State<ReceiptTemplateGeneralSection> createState() => _ReceiptTemplateGeneralSectionState();
}

class _ReceiptTemplateGeneralSectionState extends State<ReceiptTemplateGeneralSection> {
  late ReceiptTemplateFormCubit _receiptTemplateFormCubit;
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _receiptTemplateFormCubit = context.read<ReceiptTemplateFormCubit>();

    _nameController = TextEditingController(text: _receiptTemplateFormCubit.state.name);
    _descriptionController = TextEditingController(text: _receiptTemplateFormCubit.state.description);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptTemplateFormCubit, ReceiptTemplateFormState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageSectionTitle(title: 'General Information'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state.isSystemDefault) ...[
                        LabelValue.text(label: 'Receipt Name', value: state.name),
                        const UIVerticalSpace(16),
                        LabelValue.text(label: 'Description', value: state.description),
                      ] else ...[
                        AppTextFormField.vertical(
                          label: 'Receipt Name',
                          hint: 'Enter receipt name',
                          controller: _nameController,
                          isRequired: true,
                          validator: FormValidators.required('Please enter a receipt template name.'),
                          onChanged: (value) => _receiptTemplateFormCubit.setName(value),
                        ),
                        const UIVerticalSpace(16),
                        AppCheckboxListTile(
                          label: 'Set as default',
                          subtitle:
                              'When set as default, this template will be auto-selected when creating new branches.',
                          value: state.isDefault,
                          onToggle: (value) => _receiptTemplateFormCubit.setIsDefault(value),
                        ),
                      ],
                    ],
                  ),
                ),
                if (!state.isSystemDefault) ...[
                  const UIHorizontalSpace(16),
                  Expanded(
                    child: AppTextFormField.vertical(
                      label: 'Description',
                      hint: 'Enter description',
                      controller: _descriptionController,
                      onChanged: (value) => _receiptTemplateFormCubit.setDescription(value),
                    ),
                  ),
                ],
              ],
            ),
            const UIVerticalSpace(30),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
