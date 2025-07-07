// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/access_control.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/system_access_section.dart';

// class Permission {
//   final String type; // e.g. 'view', 'create', 'update', 'delete', 'export'
//   final String description;
//   bool isChecked;

//   Permission({required this.type, required this.description, this.isChecked = true});
// }

// class Feature {
//   final String name; // e.g. supply needs, purchase orders, manage employees
//   final String description;
//   final List<Permission> permissions;
//   bool isChecked;

//   Feature({required this.name, required this.description, required this.permissions, this.isChecked = true});
// }

// class Module {
//   // final EmployeeRole role;
//   final SystemAccess system;
//   final String name; // e.g., stock management, employee management
//   final String description;
//   final List<Feature> features;
//   bool isChecked;

//   Module({
//     // required this.role,
//     required this.system,
//     required this.name,
//     required this.description,
//     required this.features,
//     this.isChecked = true,
//   });
// }

part 'model.freezed.dart';

@freezed
class AccessControlModel with _$AccessControlModel {
  const factory AccessControlModel({
    SystemAccess? system,
    required String name, // e.g., stock management, employee management
    String? description,
    required List<FeatureModel> features,
    @Default(true) bool isChecked,
  }) = _AccessControlModel;

  const AccessControlModel._();

  AccessControl toAccessControl() => AccessControl(
        name: name,
        features: features
            .map((feature) => Feature(
                name: feature.name,
                permissions: feature.permissions
                    .map((permission) => Permission(
                          type: permission.type,
                          isChecked: permission.isChecked,
                        ))
                    .toList()))
            .toList(),
      );
}

@freezed
class FeatureModel with _$FeatureModel {
  const factory FeatureModel({
    required String name, // e.g. supply needs, purchase orders, manage employees
    String? description,
    required List<PermissionModel> permissions,
    @Default(true) bool isChecked,
  }) = _FeatureModel;
}

@freezed
class PermissionModel with _$PermissionModel {
  const factory PermissionModel({
    required String type, // e.g. 'view', 'create', 'update', 'delete', 'export'
    String? description,
    @Default(true) bool isChecked,
  }) = _PermissionModel;
}

// class RoleAccessControl {
//   final List<SystemAccess> system;
//   final List<AccessControl> access;

//   RoleAccessControl({required this.system, required this.access});
// }

// final Map<EmployeeRole, RoleAccessControl> defaultRoleAccessControlMap = {
//   EmployeeRole.cashier: RoleAccessControl(
//     system: [SystemAccess.pos],
//     access: [
//       AccessControl(
//         moduleKey: 'register',
//         featureKey: 'sale',
//         canView: true,
//         canCreate: true,
//       ),
//       AccessControl(
//         moduleKey: 'register',
//         featureKey: 'transactions',
//         canView: true,
//         canCreate: true,
//       ),
//     ],
//   ),
//   EmployeeRole.supervisor: RoleAccessControl(
//     system: [SystemAccess.pos],
//     access: [
//       // POS
//       AccessControl(
//         moduleKey: 'register',
//         featureKey: 'sale',
//         canView: true,
//         canCreate: true,
//       ),
//       AccessControl(
//         moduleKey: 'register',
//         featureKey: 'transactions',
//         canView: true,
//         canCreate: true,
//         canAuthorize: true,
//         canPrint: true,
//       ),
//       // Portal
//       AccessControl(
//         moduleKey: 'stock_management',
//         featureKey: 'purchase_order',
//         canView: true,
//         canCreate: true,
//         canExport: true,
//         canPrint: true,
//       ),
//     ],
//   ),
//   EmployeeRole.admin: RoleAccessControl(
//     system: [SystemAccess.pos],
//     access: [
//       AccessControl(
//         moduleKey: 'product_management',
//         featureKey: 'products',
//         canView: true,
//         canCreate: true,
//         canUpdate: true,
//         canDelete: true,
//         canExport: true,
//       ),
//       AccessControl(
//         moduleKey: 'product_management',
//         featureKey: 'suppliers',
//         canView: true,
//         canCreate: true,
//         canUpdate: true,
//         canDelete: true,
//       ),
//       AccessControl(
//         moduleKey: 'stock_management',
//         featureKey: 'supply_needs',
//         canView: true,
//         canCreate: true,
//         canExport: true,
//       ),
//       AccessControl(
//         moduleKey: 'stock_management',
//         featureKey: 'purchase_order',
//         canView: true,
//         canCreate: true,
//         canUpdate: true,
//         canDelete: true,
//         canExport: true,
//       ),
//       AccessControl(
//         moduleKey: 'stock_management',
//         featureKey: 'stock_return',
//         canView: true,
//         canCreate: true,
//         canUpdate: true,
//         canDelete: true,
//         canExport: true,
//       ),
//       AccessControl(
//         moduleKey: 'stock_management',
//         featureKey: 'stock_take',
//         canView: true,
//         canCreate: true,
//         canUpdate: true,
//         canDelete: true,
//         canExport: true,
//       ),
//       AccessControl(
//         moduleKey: 'stock_management',
//         featureKey: 'stock_transfer',
//         canView: true,
//         canCreate: true,
//         canUpdate: true,
//         canDelete: true,
//         canExport: true,
//       ),
//       AccessControl(
//         moduleKey: 'transactions',
//         featureKey: 'sales',
//         canView: true,
//         canExport: true,
//       ),
//       AccessControl(
//         moduleKey: 'transactions',
//         featureKey: 'retuns',
//         canView: true,
//       ),
//       AccessControl(
//         moduleKey: 'reports',
//         featureKey: 'product-history',
//         canView: true,
//         canExport: true,
//       ),
//       AccessControl(
//         moduleKey: 'reports',
//         featureKey: 'sales_per_category',
//         canView: true,
//         canExport: true,
//       ),
//       AccessControl(
//         moduleKey: 'reports',
//         featureKey: 'sales_per_shift',
//         canView: true,
//         canExport: true,
//       ),
//       AccessControl(
//         moduleKey: 'reports',
//         featureKey: 'lot_expiration',
//         canView: true,
//         canExport: true,
//       ),
//       AccessControl(
//         moduleKey: 'reports',
//         featureKey: 'pnl',
//         canView: true,
//         canCreate: true,
//         canExport: true,
//       ),
//       AccessControl(
//         moduleKey: 'reports',
//         featureKey: 'abc',
//         canView: true,
//         canCreate: true,
//         canExport: true,
//       ),
//       AccessControl(
//         moduleKey: 'employee_management',
//         featureKey: 'employees',
//         canView: true,
//         canCreate: true,
//         canUpdate: true,
//         canDelete: true,
//         canExport: true,
//       ),
//       AccessControl(
//         moduleKey: 'employee_management',
//         featureKey: 'timesheets',
//         canView: true,
//         canExport: true,
//       ),
//       AccessControl(
//         moduleKey: 'employee_management',
//         featureKey: 'activity_logs',
//         canView: true,
//         canExport: true,
//       ),
//       AccessControl(
//         moduleKey: 'settings',
//         featureKey: 'tax',
//         canView: true,
//         canCreate: true,
//         canUpdate: true,
//         canDelete: true,
//       ),
//       AccessControl(
//         moduleKey: 'settings',
//         featureKey: 'branch',
//         canView: true,
//         canCreate: true,
//         canUpdate: true,
//         canDelete: true,
//       ),
//       AccessControl(
//         moduleKey: 'settings',
//         featureKey: 'pos_register',
//         canView: true,
//         canCreate: true,
//         canUpdate: true,
//         canDelete: true,
//       ),
//       AccessControl(
//         moduleKey: 'settings',
//         featureKey: 'receipt_template',
//         canView: true,
//         canCreate: true,
//         canUpdate: true,
//         canDelete: true,
//       ),
//     ],
//   ),
// };

// class FeatureDefinition {
//   final String key;
//   final String name;
//   final String description;

//   FeatureDefinition({required this.key, required this.name, required this.description});
// }

// class ModuleDefinition {
//   final String key;
//   final String name;
//   final String description;
//   final List<FeatureDefinition> features;

//   ModuleDefinition({required this.key, required this.name, required this.description, required this.features});
// }

// class AccessControl {
//   final String moduleKey;
//   final String featureKey;
//   final bool canView;
//   final bool canCreate;
//   final bool canUpdate;
//   final bool canDelete;
//   final bool canExport;
//   final bool canPrint;
//   final bool canAuthorize;

//   AccessControl({
//     required this.moduleKey,
//     required this.featureKey,
//     this.canView = false,
//     this.canCreate = false,
//     this.canUpdate = false,
//     this.canDelete = false,
//     this.canExport = false,
//     this.canPrint = false,
//     this.canAuthorize = false,
//   });
// }
// In Employee entity
// List<AccessControl> access;
