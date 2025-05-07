import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/form_validators.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/bloc/cubit/branch_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class BranchBusinessSection extends StatefulWidget {
  const BranchBusinessSection({super.key});

  @override
  State<BranchBusinessSection> createState() => _BranchBusinessSectionState();
}

class _BranchBusinessSectionState extends State<BranchBusinessSection> {
  late TextEditingController _brnController;
  late TextEditingController _vatIdController;
  late BranchFormCubit _formCubit;

  @override
  void initState() {
    super.initState();

    _formCubit = context.read<BranchFormCubit>();

    _brnController = TextEditingController(text: _formCubit.state.businessRegistrationNumber);
    _vatIdController = TextEditingController(text: _formCubit.state.vatIdNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageSectionTitle(title: 'Business Information'),
        Row(
          children: [
            Expanded(
              child: UITextFormField.vertical(
                label: 'Business Registration Number (BRN)',
                hint: 'Enter business registration number',
                controller: _brnController,
                isRequired: true,
                validator: FormValidators.required('Please enter the BRN.'),
                onChanged: (value) => _formCubit.setBusinessRegistrationNumber(value),
              ),
            ),
            const UIHorizontalSpace(16),
            Expanded(
              child: UITextFormField.vertical(
                label: 'GST/VAT Id. No.',
                hint: 'Enter GST/VAT Id. No.',
                controller: _vatIdController,
                onChanged: (value) => _formCubit.setVatIdNumber(value),
              ),
            ),
          ],
        ),
        // Receipt Template
        const UIVerticalSpace(48),
      ],
    );
  }

  @override
  void dispose() {
    _brnController.dispose();
    _vatIdController.dispose();
    super.dispose();
  }
}
