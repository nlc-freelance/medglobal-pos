import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/cubit/role_access_cubit/role_access_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

enum EmployeeRole {
  cashier,
  supervisor,
  admin;

  static EmployeeRole fromString(String value) {
    switch (value.toLowerCase().trim()) {
      case 'cashier':
        return EmployeeRole.cashier;
      case 'supervisor':
        return EmployeeRole.supervisor;
      case 'admin':
        return EmployeeRole.admin;
      default:
        throw ArgumentError.value(
            value, "Invalid EmployeeRole string. Expected one of: 'cashier', 'supervisor', 'admin'");
    }
  }

  /// [key] is the bg color, and [value] is the foreground color
  Map<Color, Color> get colors {
    switch (this) {
      case EmployeeRole.admin:
        return {UIColors.indigoBg: UIColors.indigo};
      case EmployeeRole.supervisor:
        return {UIColors.awaitingActionBg: UIColors.awaitingAction};
      case EmployeeRole.cashier:
        return {UIColors.magentaBg: UIColors.magenta};
    }
  }
}

class RoleSection extends StatelessWidget {
  const RoleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIText.heading6('Role'),
        const UIVerticalSpace(12),
        Row(
          children: [
            BlocBuilder<RoleAccessCubit, RoleAccessState>(
              builder: (context, state) {
                return AppRadioGroup<EmployeeRole>(
                  items: EmployeeRole.values,
                  value: state.role,
                  onChanged: (role) => context.read<RoleAccessCubit>().setRole(role),
                  itemAsString: (role) => role.name.capitalized,
                  labelStyle: UIStyleText.bodyRegular,
                  spacing: 16,
                );
              },
            ),
          ],
        ),
        const UIVerticalSpace(30),
      ],
    );
  }
}
