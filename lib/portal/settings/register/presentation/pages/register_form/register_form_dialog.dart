import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:medglobal_admin_portal/core/utils/form_validators.dart';
import 'package:medglobal_admin_portal/core/widgets/dialog/app_custom_dialog.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/settings/register/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/register/presentation/cubit/register_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class RegisterFormDialog extends StatefulWidget {
  const RegisterFormDialog({super.key});

  @override
  State<RegisterFormDialog> createState() => _RegisterFormDialogState();
}

class _RegisterFormDialogState extends State<RegisterFormDialog> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  late RegisterFormCubit _registerFormCubit;
  late RegisterBloc _registerBloc;

  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();

    _registerFormCubit = context.read<RegisterFormCubit>();
    _registerBloc = context.read<RegisterBloc>();

    // Since the Form is just in a dialog and upon deletion the confirmation dialog is closed immediately,
    // reset the state of the RegisterBloc to prevent stale error messages from when deletion failed
    _registerBloc.add(const RegisterEvent.reset());

    _nameController = TextEditingController(text: _registerFormCubit.state.name);
  }

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: AppCustomDialog(
        title: _registerFormCubit.state.id != null ? 'Edit POS Register' : 'Add POS Register',
        content: Form(
          key: _registerFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextFormField.top(
                label: 'POS Register Name',
                hint: 'Enter POS register name',
                controller: _nameController,
                isRequired: true,
                validator: FormValidators.required('Please enter a tax code name.'),
                onChanged: (value) => _registerFormCubit.setName(value),
              ),
              const UIVerticalSpace(16),
              BranchDropdown.input_top(
                hint: 'Select branch',
                label: 'Assigned Branch',
                selectedItem: _registerFormCubit.state.assignedBranch,
                required: true,
                onSelectItem: (value) => _registerFormCubit.setAssignedBranch(value),
                isReadOnly: _registerFormCubit.state.assignedBranch != null,
              ),
              Text(
                _hasAssignedBranch
                    ? 'This branch was assigned when the register was created and can no longer be changed.'
                    : 'You can only assign a branch when creating the register — it can\'t be changed afterward.',
                style: UIStyleText.hint.copyWith(color: UIColors.textMuted),
              ),
              const UIVerticalSpace(24),
              BlocBuilder<RegisterBloc, RegisterState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    failure: (message) => PageErrorNotice(message: message),
                    orElse: () => const SizedBox(),
                  );
                },
              ),
            ],
          ),
        ),
        actions: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            UIButton.outlined('Cancel', onClick: () => Navigator.pop(context)),
            const UIHorizontalSpace(8),
            UIButton.filled('Save', onClick: _onSave),
          ],
        ),
      ),
    );
  }

  bool get _hasAssignedBranch => _registerFormCubit.state.assignedBranch != null;

  void _onSave() {
    if (_registerFormKey.currentState?.validate() == true) {
      final register = _registerFormCubit.toRegister();

      final event = _registerFormCubit.state.id == null
          ? RegisterEvent.createRegister(register)
          : RegisterEvent.updateRegister(register);

      _registerBloc.add(event);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();

    // Reset cubit and bloc upon dialog dispose
    _registerFormCubit.reset();
    _registerBloc.add(const RegisterEvent.reset());

    super.dispose();
  }
}
