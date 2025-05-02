import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/portal/settings/pos_register/presentation/cubit/pos_register_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PosRegisterFormDialog extends StatelessWidget {
  const PosRegisterFormDialog({super.key, required this.cubit});

  final PosRegisterFormCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: const RegisterForm(),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late PosRegisterFormCubit _formCubit;
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();

    _formCubit = context.read<PosRegisterFormCubit>();

    _nameController = TextEditingController(text: _formCubit.state.name);
  }

  void _onSave() {
    if (_formKey.currentState?.validate() == true) {
      /// CreateRegister Bloc Event
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: Dialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
        backgroundColor: UIColors.background,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: UIText.heading5(_formCubit.state.id != null ? 'Edit POS Register' : 'Add POS Register'),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      visualDensity: VisualDensity.compact,
                      padding: const EdgeInsets.all(2),
                      icon: Assets.icons.close.svg(),
                    ),
                  ],
                ),
                const Divider(color: UIColors.borderMuted),
                const UIVerticalSpace(16),
                UITextFormField.vertical(
                  label: 'POS Register Name',
                  hint: 'Enter POS register name',
                  controller: _nameController,
                  isRequired: true,
                  validation: 'Please enter a tax code name.',
                  onChanged: (value) => _formCubit.setName(value),
                ),
                const UIVerticalSpace(16),
                BranchDropdown.input_top(
                  hint: 'Select branch',
                  label: 'Assigned Branch',
                  selectedItem: _formCubit.state.assignedBranch,
                  required: true,
                  onSelectItem: (value) => _formCubit.setAssignedBranch(value),
                ),
                const UIVerticalSpace(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    UIButton.outlined('Cancel', onClick: () => Navigator.pop(context)),
                    const UIHorizontalSpace(8),
                    UIButton.filled('Save', onClick: _onSave),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _formCubit.reset();
    super.dispose();
  }
}
