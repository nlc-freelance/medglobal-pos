import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/form_validators.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/cubit/employee_form_cubit/employee_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class EmployeeGeneralSection extends StatefulWidget {
  const EmployeeGeneralSection({super.key});

  @override
  State<EmployeeGeneralSection> createState() => _EmployeeGeneralSectionState();
}

class _EmployeeGeneralSectionState extends State<EmployeeGeneralSection> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late EmployeeFormCubit _formCubit;

  @override
  void initState() {
    super.initState();

    _formCubit = context.read<EmployeeFormCubit>();

    _firstNameController = TextEditingController(text: _formCubit.state.firstName);
    _lastNameController = TextEditingController(text: _formCubit.state.lastName);
    _emailController = TextEditingController(text: _formCubit.state.email);
    _phoneController = TextEditingController(text: _formCubit.state.phone);
  }

  @override
  Widget build(BuildContext context) {
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
                  AppTextFormField.top(
                    label: 'First Name',
                    hint: 'Enter first name',
                    controller: _firstNameController,
                    isRequired: true,
                    validator: FormValidators.required('Please enter a first name.'),
                    onChanged: (value) => _formCubit.setFirstName(value),
                  ),
                  const UIVerticalSpace(16),
                  AppTextFormField.top(
                    label: 'Email Address',
                    hint: 'Enter email address',
                    controller: _emailController,
                    isRequired: true,
                    validator: (value) => FormValidators.run(value, [
                      FormValidators.required('Please enter an email address.'),
                      FormValidators.email(),
                    ]),
                    onChanged: (value) => _formCubit.setEmail(value),
                    isReadOnly: _formCubit.state.email?.isNotEmpty == true,
                  ),
                  const UIVerticalSpace(4),
                  Text(
                    _formCubit.state.email?.isNotEmpty == true
                        ? 'This email was assigned when the employee was created and can no longer be changed.'
                        : 'You can only set the email when creating the employee — it can\'t be changed afterward.',
                    style: UIStyleText.hint.copyWith(color: UIColors.textMuted),
                  ),
                  const UIVerticalSpace(16),
                  BlocBuilder<EmployeeFormCubit, EmployeeFormState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppDropdownFormField<BranchPartial>.lazy(
                            hint: state.assignedBranches.isEmpty
                                ? 'Select branches to assign'
                                : '${state.assignedBranches.length} branch(es) selected',
                            label: 'Assigned Branches',
                            getName: (branch) => branch.name!,
                            isMultiSelect: true,
                            onChanged: (branch) => _formCubit.toggleAssignedBranch(branch),
                            onRemoveFromMultiSelect: (branch) => _formCubit.removeAssignedBranch(branch),
                            isSelectedInMultiSelect: (branch) => _formCubit.state.isBranchSelected(branch),
                          ),
                          if (state.assignedBranches.isNotEmpty) ...[
                            const UIVerticalSpace(8),
                            Wrap(
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.center,
                              runSpacing: 6,
                              spacing: 4,
                              children: state.assignedBranches
                                  .map(
                                    (item) => Chip(
                                      label: Text(item.name!, style: UIStyleText.chip),
                                      deleteButtonTooltipMessage: 'Remove supplier',
                                      backgroundColor: UIColors.whiteBg,
                                      deleteIcon: Assets.icons.close.svg(),
                                      onDeleted: () => _formCubit.removeAssignedBranch(item),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: const BorderSide(color: UIColors.borderMuted, width: 0.8),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ],
                      );
                      // return BranchDropdown.input_top(
                      //   label: 'Assigned Branches',
                      //   hint: 'Select branches to assign',
                      //   showSelectedItems: true,
                      //   isMultiSelect: true,
                      //   selectedItems: state.assignedBranches,
                      //   onDeleteItem: (id) => _formCubit.removeAssignedBranch(id),
                      //   onSelectItem: (branch) => _formCubit.addAssignedBranch(branch),
                      // );
                    },
                  )
                ],
              ),
            ),
            const UIHorizontalSpace(16),
            Expanded(
              child: Column(
                children: [
                  AppTextFormField.top(
                    label: 'Last Name',
                    hint: 'Enter last name',
                    controller: _lastNameController,
                    isRequired: true,
                    validator: FormValidators.required('Please enter a last name.'),
                    onChanged: (value) => _formCubit.setLastName(value),
                  ),
                  const UIVerticalSpace(16),
                  AppTextFormField.top(
                    label: 'Phone',
                    hint: 'Enter contact number',
                    controller: _phoneController,
                    isRequired: true,
                    validator: FormValidators.required('Please enter a contact number.'),
                    onChanged: (value) => _formCubit.setPhone(value),
                  ),
                ],
              ),
            ),
          ],
        ),
        const UIVerticalSpace(30),
      ],
    );
  }
}
