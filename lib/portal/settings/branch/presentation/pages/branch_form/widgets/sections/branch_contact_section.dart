import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/form_validators.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/cubit/branch_form_cubit/branch_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/pages/branch_form/widgets/sections/branch_address_subsection.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class BranchContactSection extends StatefulWidget {
  const BranchContactSection({super.key});

  @override
  State<BranchContactSection> createState() => _BranchContactSectionState();
}

class _BranchContactSectionState extends State<BranchContactSection> {
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late BranchFormCubit _formCubit;

  @override
  void initState() {
    super.initState();

    _formCubit = context.read<BranchFormCubit>();

    _phoneController = TextEditingController(text: _formCubit.state.phone);
    _emailController = TextEditingController(text: _formCubit.state.email);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageSectionTitle(title: 'Contact Information'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AppTextFormField.vertical(
                label: 'Phone',
                hint: 'Enter contact number',
                controller: _phoneController,
                isRequired: true,
                validator: FormValidators.required('Please enter a contact number.'),
                onChanged: (value) => _formCubit.setPhone(value),
              ),
            ),
            const UIHorizontalSpace(16),
            Expanded(
              child: AppTextFormField.vertical(
                label: 'Email',
                hint: 'Enter email address',
                controller: _emailController,
                validator: FormValidators.email(),
                onChanged: (value) => _formCubit.setEmail(value),
              ),
            ),
          ],
        ),
        const UIVerticalSpace(30),
        const BranchAddressSubsection(),
      ],
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
