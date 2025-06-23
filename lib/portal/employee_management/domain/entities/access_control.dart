import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/models/model.dart';

part 'access_control.freezed.dart';

@freezed
class AccessControl with _$AccessControl {
  const factory AccessControl({
    required String name, // e.g., stock management, employee management
    required List<Feature> features,
  }) = _AccessControl;

  const AccessControl._();

  AccessControlModel toAccessControlModel() => AccessControlModel(
        name: name,
        isChecked: features.any((feat) => feat.permissions.any((perm) => perm.isChecked)), //
        features: features
            .map((feature) => FeatureModel(
                  name: feature.name,
                  isChecked: feature.permissions.any((perm) => perm.isChecked), //
                  permissions: feature.permissions
                      .map((permission) => PermissionModel(
                            type: permission.type,
                            isChecked: permission.isChecked,
                          ))
                      .toList(),
                ))
            .toList(),
      );
}

@freezed
class Feature with _$Feature {
  const factory Feature({
    required String name, // e.g. supply needs, purchase orders, manage employees
    required List<Permission> permissions,
  }) = _Feature;
}

@freezed
class Permission with _$Permission {
  const factory Permission({
    required String type, // e.g. 'view', 'create', 'update', 'delete', 'export'
    required bool isChecked,
  }) = _Permission;
}
