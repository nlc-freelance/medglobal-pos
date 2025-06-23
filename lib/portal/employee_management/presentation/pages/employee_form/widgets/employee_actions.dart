import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/extensions/extensions.dart';
import 'package:medglobal_admin_portal/core/mixins/dialog_mixin.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/gen/assets.gen.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/bloc/employee_bloc/employee_bloc.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/cubit/employee_form_cubit/employee_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/cubit/role_access_cubit/role_access_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class EmployeeActions extends StatelessWidget with DialogMixin {
  const EmployeeActions({
    super.key,
    required this.isEditMode,
    required this.formKey,
  });

  final bool isEditMode;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<EmployeeBloc, EmployeeState>(
            builder: (builderContext, state) => state.maybeWhen(
              failure: (message) => PageErrorNotice(message: message),
              orElse: () => const SizedBox(),
            ),
          ),
          Row(
            children: [
              if (isEditMode)
                UIButton.text(
                  'Delete',
                  iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
                  onClick: () => _onDelete(context),
                ),
              const Spacer(),
              UIButton.outlined('Cancel', onClick: () => _onCancel(context)),
              const UIHorizontalSpace(8),
              UIButton.filled('Save', onClick: () => _onSave(context)),
            ],
          ),
        ],
      ),
    );
  }

  void _onDelete(BuildContext context) {
    final formCubit = context.read<EmployeeFormCubit>();
    final rbac = context.read<RoleAccessCubit>().state;

    showDeleteDialog(
      context,
      subject: 'Employee',
      item: formCubit.state.name,
      onDelete: () => context.read<EmployeeBloc>().add(EmployeeEvent.deleteEmployee(formCubit.toEmployee(rbac))),
    );
  }

  void _onCancel(BuildContext context) => Navigator.pop(context);

  void _onSave(BuildContext context) {
    final formCubit = context.read<EmployeeFormCubit>();
    final rbac = context.read<RoleAccessCubit>();

    rbac.validate();

    if (formKey.currentState?.validate() == true && rbac.state.isFormValid) {
      final employee = formCubit.toEmployee(rbac.state);

      if (formCubit.state.id == null) {
        context.read<EmployeeBloc>().add(EmployeeEvent.createEmployee(employee));
      } else {
        context.read<EmployeeBloc>().add(EmployeeEvent.updateEmployee(employee));
      }
    }
  }
}
