import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/form_validators.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/cubit/branch_form_cubit/branch_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class BranchGeneralSection extends StatefulWidget {
  const BranchGeneralSection({super.key});

  @override
  State<BranchGeneralSection> createState() => _BranchGeneralSectionState();
}

class _BranchGeneralSectionState extends State<BranchGeneralSection> {
  late TextEditingController _nameController;
  late BranchFormCubit _formCubit;

  @override
  void initState() {
    super.initState();
    _formCubit = context.read<BranchFormCubit>();

    _nameController = TextEditingController(text: _formCubit.state.name);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageSectionTitle(title: 'General Information'),
        AppTextFormField.top(
          label: 'Branch Name',
          hint: 'Enter branch name',
          controller: _nameController,
          isRequired: true,
          validator: FormValidators.required('Please enter a branch name.'),
          onChanged: (value) => _formCubit.setName(value),
        ),
        const UIVerticalSpace(30),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
