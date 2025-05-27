import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/models/model.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PermissionTile extends StatelessWidget {
  const PermissionTile({super.key, required this.module});

  final ModulePermission module;

  @override
  Widget build(BuildContext context) {
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
                labelStyle: UIStyleText.bodyRegular,
                value: module.hasFullAccess,
                onToggle: (value) {},
              ),
            ),
            const UIHorizontalSpace(16),
            Expanded(flex: 4, child: UIText.bodyRegular(module.description)),
          ],
        ),
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
                        label: feature.feature,
                        labelStyle: UIStyleText.bodyRegular,
                        value: feature.hasFullAccess,
                        onToggle: (value) {},
                      ),
                    ),
                  ),
                  const UIHorizontalSpace(16),
                  Expanded(flex: 4, child: UIText.bodyRegular(feature.description)),
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
                            value: permission.isAllowed,
                            onToggle: (value) {},
                          ),
                        ),
                      ),
                      const UIHorizontalSpace(16),
                      Expanded(flex: 4, child: UIText.bodyRegular(permission.description)),
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

final productManagement = ModulePermission(
  name: 'Product Management',
  description: 'Allow full access and control to all product management features',
  features: [
    FeaturePermission(
      feature: 'Products',
      description: 'Allow all actions for products and variants',
      permissions: [
        Permission(
          type: PermissionType.view.name.capitalized,
          description: 'View all products',
          isAllowed: false,
        ),
        Permission(
          type: PermissionType.create.name.capitalized,
          description: 'Create new products and variants',
          isAllowed: false,
        ),
        Permission(
          type: PermissionType.update.name.capitalized,
          description: 'Edit existing products and variants',
          isAllowed: false,
        ),
        Permission(
          type: PermissionType.delete.name.capitalized,
          description: 'Delete existing products and variants',
          isAllowed: false,
        ),
        Permission(
          type: PermissionType.export.name.capitalized,
          description: 'Export product list',
          isAllowed: false,
        ),
      ],
      hasFullAccess: false,
    ),
  ],
  hasFullAccess: false,
);

enum PermissionType { view, create, update, delete, export }
