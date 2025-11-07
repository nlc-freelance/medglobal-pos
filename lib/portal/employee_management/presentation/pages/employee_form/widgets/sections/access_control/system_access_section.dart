import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/cubit/role_access_cubit/role_access_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SystemAccessSection extends StatelessWidget {
  const SystemAccessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoleAccessCubit, RoleAccessState>(
      builder: (context, state) {
        return state.role == null
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText.heading6('System Access'),
                  const UIVerticalSpace(12),
                  Wrap(
                    spacing: 16,
                    children: state.systemAccess.entries
                        .map((system) => ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 200),
                              child: AppCheckboxListTile(
                                value: system.value,
                                label: system.key.label,
                                labelStyle: UIStyleText.bodyRegular,
                                onToggle: (value) =>
                                    context.read<RoleAccessCubit>().updateSystemAccess(system.key, value),
                              ),
                            ))
                        .toList(),
                  ),
                  const UIVerticalSpace(30),
                ],
              );
      },
    );
  }
}

enum SystemAccess {
  pos('POS Register'),
  portal('Portal');

  const SystemAccess(this.label);
  final String label;

  static SystemAccess fromString(String value) {
    switch (value.toLowerCase().trim()) {
      case 'portal':
        return SystemAccess.portal;
      case 'pos register':
        return SystemAccess.pos;
      default:
        throw ArgumentError.value(value, "Invalid SystemAccess string. Expected one of: 'pos register', 'portal'");
    }
  }
}
