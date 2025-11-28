import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/cubit/role_access_cubit/role_access_cubit.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/models/description.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class DetailedActionLevelPermission extends StatelessWidget {
  const DetailedActionLevelPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoleAccessCubit, RoleAccessState>(
      builder: (context, state) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: state.accessControls.length,
            itemBuilder: (context, moduleIndex) {
              final module = state.accessControls[moduleIndex];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 1,
                        child: AppCheckboxListTile(
                          label: module.name,
                          labelStyle: UIStyleText.label,
                          value: module.isChecked,
                          onToggle: (value) => context.read<RoleAccessCubit>().toggleModule(module.name, value),
                        ),
                      ),
                      const UIHorizontalSpace(16),
                      Expanded(flex: 4, child: UIText.bodyRegular('')),
                    ],
                  ),
                  const UIVerticalSpace(4),
                  ...module.features.map(
                    (feature) => Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: AppCheckboxListTile(
                                  label: feature.name,
                                  labelStyle: UIStyleText.bodyRegular,
                                  value: feature.isChecked,
                                  onToggle: (value) =>
                                      context.read<RoleAccessCubit>().toggleFeature(module.name, feature.name, value),
                                ),
                              ),
                            ),
                            const UIHorizontalSpace(16),
                            Expanded(
                                flex: 4,
                                child: UIText.bodyRegular(AccessControlDescription.feature(module.name, feature.name))),
                          ],
                        ),
                        ...feature.permissions.map((permission) => Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 48),
                                    child: AppCheckboxListTile(
                                      label: permission.type,
                                      labelStyle: UIStyleText.bodyRegular,
                                      value: permission.isChecked,
                                      onToggle: (value) => context
                                          .read<RoleAccessCubit>()
                                          .togglePermission(module.name, feature.name, permission.type, value),
                                    ),
                                  ),
                                ),
                                const UIHorizontalSpace(16),
                                Expanded(
                                  flex: 4,
                                  child: UIText.bodyRegular(AccessControlDescription.permission(
                                    module.name,
                                    feature.name,
                                    permission.type.toLowerCase(),
                                  )),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  const UIVerticalSpace(8),
                ],
              );
            });
      },
    );
  }
}

enum PermissionType {
  view,
  create,
  update,
  delete,
  export,
  print,
  refund,
  authorize,
  reprint,
}
