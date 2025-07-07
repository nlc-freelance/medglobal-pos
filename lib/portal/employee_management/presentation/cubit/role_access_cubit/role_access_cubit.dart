import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/models/model.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/detailed_action_level_permision.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/role_section.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/system_access_section.dart';

part 'role_access_state.dart';
part 'role_access_cubit.freezed.dart';

class RoleAccessCubit extends Cubit<RoleAccessState> {
  RoleAccessCubit() : super(RoleAccessState.initial());

  void loadRoleAccess(Employee employee) => emit(RoleAccessState.fromEmployee(employee));

  void setRole(EmployeeRole role) {
    final systems = roleBasedSystemAccessMap[role]!;

    final roleBasedSystemAccess = {for (var system in systems) system: true};

    final roleBasedModuleAccess = roleBasedModuleMap[role]!;

    emit(state.copyWith(
      role: role,
      systemAccess: roleBasedSystemAccess,
      accessControls: roleBasedModuleAccess,
      isFormValid: roleBasedSystemAccess.entries.any((system) => system.value == true) &&
          roleBasedModuleAccess.any((system) => system.isChecked),
    ));
  }

  void updateSystemAccess(SystemAccess system, bool value) {
    final updatedSystemAccess = Map<SystemAccess, bool>.from(state.systemAccess)..[system] = value;
    final updatedModuleAccess = roleBasedModuleMap[state.role]!
        .where((item) => updatedSystemAccess.containsKey(item.system) && updatedSystemAccess[item.system] == true)
        .toList();
    emit(state.copyWith(
      systemAccess: updatedSystemAccess,
      accessControls: updatedModuleAccess,
      isFormValid: updatedSystemAccess.entries.any((system) => system.value == true),
    ));
  }

  void toggleModule(String moduleName, bool value) {
    final modules = state.accessControls.map((module) {
      if (module.name == moduleName) {
        return module.copyWith(
          isChecked: value,
          features: module.features
              .map((feature) => feature.copyWith(
                  isChecked: value,
                  permissions: feature.permissions.map((permission) => permission.copyWith(isChecked: value)).toList()))
              .toList(),
        );
      } else {
        return module;
      }
    }).toList();

    emit(state.copyWith(
      accessControls: modules,
      isFormValid: modules.any((module) => module.isChecked),
    ));
  }

  void toggleFeature(String moduleName, String featureName, bool value) {
    final modules = state.accessControls.map((module) {
      if (module.name == moduleName) {
        return module.copyWith(
          features: module.features
              .map((feature) => feature.name == featureName
                  ? feature.copyWith(
                      isChecked: value,
                      permissions:
                          feature.permissions.map((permission) => permission.copyWith(isChecked: value)).toList())
                  : feature)
              .toList(),
        );
      } else {
        return module;
      }
    }).toList();

    // Update module checkbox
    final isModuleCheck =
        modules.firstWhere((module) => module.name == moduleName).features.any((feature) => feature.isChecked);
    final updatedModules = modules
        .map((module) => module.name == moduleName ? module.copyWith(isChecked: isModuleCheck) : module)
        .toList();
    emit(state.copyWith(
      accessControls: updatedModules,
      isFormValid: updatedModules.any((module) => module.isChecked),
    ));
  }

  void togglePermission(String moduleName, String featureName, String permissionName, bool value) {
    final modules = state.accessControls.map((module) {
      if (module.name == moduleName) {
        return module.copyWith(
          features: module.features
              .map((feature) => feature.name == featureName
                  ? feature.copyWith(
                      isChecked: value,
                      permissions: feature.permissions
                          .map((permission) =>
                              permission.type == permissionName ? permission.copyWith(isChecked: value) : permission)
                          .toList())
                  : feature)
              .toList(),
        );
      } else {
        return module;
      }
    }).toList();

    // Update feature checkbox
    final isFeatureCheck = modules
        .firstWhere((module) => module.name == moduleName)
        .features
        .firstWhere((feature) => feature.name == featureName)
        .permissions
        .any((permission) => permission.isChecked);

    final isModuleCheck = modules
        .firstWhere((module) => module.name == moduleName)
        .features
        .firstWhere((feature) => feature.name == featureName)
        .permissions
        .any((permission) => permission.isChecked);

    final updatedModules = modules
        .map((module) => module.name == moduleName
            ? module.copyWith(
                isChecked: isModuleCheck,
                features: module.features
                    .map((feature) =>
                        feature.name == featureName ? feature.copyWith(isChecked: isFeatureCheck) : feature)
                    .toList())
            : module)
        .toList();

    emit(state.copyWith(
      accessControls: updatedModules,
      isFormValid: updatedModules.any((module) => module.isChecked),
    ));
  }

  void validate() {
    emit(state.copyWith(isFormValid: state.hasValidForm()));
  }

  final roleBasedSystemAccessMap = {
    EmployeeRole.admin: [SystemAccess.portal],
    EmployeeRole.supervisor: [SystemAccess.pos, SystemAccess.portal],
    EmployeeRole.cashier: [SystemAccess.pos],
  };

  final roleBasedModuleMap = {
    EmployeeRole.admin: [
      productManagementControl,
      stockManagementControl,
      transactionsControl,
      reportsControl,
      employeeManagementControl,
      settingsControl,
    ],
    EmployeeRole.supervisor: [
      supervisorRegister,
      po,
    ],
    EmployeeRole.cashier: [cashierRegister],
  };
}

final productManagementControl = AccessControlModel(
  system: SystemAccess.portal,
  name: 'Product Management',
  // description: 'Allow full access and control to all product management features',
  features: [
    FeatureModel(
      name: 'Products',
      // description: 'Allow all actions for products and variants',
      permissions: [
        PermissionModel(
          type: PermissionType.view.name.capitalized,
          // description: 'View all products',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.create.name.capitalized,
          // description: 'Create new products and variants',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.update.name.capitalized,
          // description: 'Edit existing products and variants',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.delete.name.capitalized,
          // description: 'Delete existing products and variants',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.export.name.capitalized,
          // description: 'Export list of products',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
    FeatureModel(
      name: 'Suppliers',
      // description: 'Allow all actions for suppliers',
      permissions: [
        PermissionModel(
          type: PermissionType.view.name.capitalized,
          // description: 'View all suppliers',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.create.name.capitalized,
          // description: 'Create new suppliers',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.update.name.capitalized,
          // description: 'Edit existing suppliers',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.delete.name.capitalized,
          // description: 'Delete existing suppliers',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
  ],
  isChecked: true,
);

final stockManagementControl = AccessControlModel(
  system: SystemAccess.portal,
  name: 'Stock Management',
  // description: 'Allow full access and control to all stock management features',
  features: [
    FeatureModel(
      name: 'Supply Needs',
      // description: 'Allow all actions for supply needs',
      permissions: [
        PermissionModel(
          type: PermissionType.view.name.capitalized,
          // description: 'View all supply needs',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.create.name.capitalized,
          // description: 'Create new purchase order or stock transfer from supply needs',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.export.name.capitalized,
          // description: 'Export list of supply needs',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
    FeatureModel(
      name: 'Purchase Order',
      // description: 'Allow all actions for purchase order',
      permissions: [
        PermissionModel(
          type: PermissionType.view.name.capitalized,
          // description: 'View all purchase order',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.create.name.capitalized,
          // description: 'Create new purchase order',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.update.name.capitalized,
          // description: 'Edit, receive, complete or cancel existing purchase order',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.delete.name.capitalized,
          // description: 'Delete existing purchase order',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.print.name.capitalized,
          // description: 'Print purchase order invoice',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.export.name.capitalized,
          // description: 'Export list of purchase orders',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
    FeatureModel(
      name: 'Stock Return',
      // description: 'Allow all actions for stock return',
      permissions: [
        PermissionModel(
          type: PermissionType.view.name.capitalized,
          // description: 'View all stock return',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.create.name.capitalized,
          // description: 'Create new stock return',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.update.name.capitalized,
          // description: 'Edit, complete existing stock return',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.delete.name.capitalized,
          // description: 'Delete existing stock return',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.export.name.capitalized,
          // description: 'Export list of stock returns',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
    FeatureModel(
      name: 'Stock Take',
      // description: 'Allow all actions for stock take',
      permissions: [
        PermissionModel(
          type: PermissionType.view.name.capitalized,
          // description: 'View all stock take',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.create.name.capitalized,
          // description: 'Create new stock take',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.update.name.capitalized,
          // description: 'Edit, complete or cancel existing stock take',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.delete.name.capitalized,
          // description: 'Delete existing stock take',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.export.name.capitalized,
          // description: 'Export list of stock take',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
    FeatureModel(
      name: 'Stock Transfer',
      // description: 'Allow all actions for stock transfer',
      permissions: [
        PermissionModel(
          type: PermissionType.view.name.capitalized,
          // description: 'View all stock transfer',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.create.name.capitalized,
          // description: 'Create new stock transfer',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.update.name.capitalized,
          // description: 'Edit, ship, receive, complete or cancel existing stock transfer',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.delete.name.capitalized,
          // description: 'Delete existing stock transfer',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.export.name.capitalized,
          // description: 'Export list of stock transfer',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
  ],
  isChecked: true,
);

final transactionsControl = AccessControlModel(
  system: SystemAccess.portal,
  name: 'Transactions',
  // description: 'Allow full access and control to all transaction features',
  features: [
    FeatureModel(
      name: 'Sales',
      // description: 'Allow all actions for sales',
      permissions: [
        PermissionModel(
          type: PermissionType.view.name.capitalized,
          // description: 'View all sale transaction',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.export.name.capitalized,
          // description: 'Export list of sale transaction',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
    FeatureModel(
      name: 'Returns',
      // description: 'Allow all actions for returns',
      permissions: [
        PermissionModel(
          type: PermissionType.view.name.capitalized,
          // description: 'View all return transactions',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.update.name.capitalized,
          // description: 'Process the items of the return transaction',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
  ],
  isChecked: true,
);

final reportsControl = AccessControlModel(
  system: SystemAccess.portal,
  name: 'Reports',
  // description: 'Allow full access and control to all report features',
  features: [
    FeatureModel(
      name: 'Product History',
      // description: 'Allow all actions for product history',
      permissions: [
        PermissionModel(
          type: PermissionType.view.name.capitalized,
          // description: 'View all product history',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.export.name.capitalized,
          // description: 'Export list of product history',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
    FeatureModel(
      name: 'Sales per Category',
      // description: 'Allow all actions for sales per category',
      permissions: [
        PermissionModel(
          type: PermissionType.view.name.capitalized,
          // description: 'View sales per category report',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.export.name.capitalized,
          // description: 'Export sales per category report',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
    FeatureModel(
      name: 'Sales per Shift',
      // description: 'Allow all actions for sales per shift',
      permissions: [
        PermissionModel(
          type: PermissionType.view.name.capitalized,
          // description: 'View sales per shift report',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.export.name.capitalized,
          // description: 'Export sales per shift report',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
    FeatureModel(
      name: 'Product Profit and Loss',
      // description: 'Allow all actions for product profit and loss',
      permissions: [
        PermissionModel(
          type: PermissionType.create.name.capitalized,
          // description: 'Generate product profit and loss report',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.export.name.capitalized,
          // description: 'Export product profit and loss report',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
    FeatureModel(
      name: 'ABC Analysis',
      // description: 'Allow all actions for ABC analysis',
      permissions: [
        PermissionModel(
          type: PermissionType.create.name.capitalized,
          // description: 'Generate ABC analysis report',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.export.name.capitalized,
          // description: 'Export ABC analysis report',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
    FeatureModel(
      name: 'Lot Expirations',
      // description: 'Allow all actions for lot expiration',
      permissions: [
        PermissionModel(
          type: PermissionType.view.name.capitalized,
          // description: 'View all lot expiration',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.export.name.capitalized,
          // description: 'Export list of lot expiration',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
  ],
  isChecked: true,
);

final employeeManagementControl = AccessControlModel(
  system: SystemAccess.portal,
  name: 'Employees',
  // description: 'Allow full access and control to all employee management features',
  features: [
    FeatureModel(
      name: 'Manage Employees',
      // description: 'Allow all actions for employees',
      permissions: [
        PermissionModel(
          type: PermissionType.view.name.capitalized,
          // description: 'View all employees',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.create.name.capitalized,
          // description: 'Create new employee',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.update.name.capitalized,
          // description: 'Edit existing employee',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.delete.name.capitalized,
          // description: 'Delete existing employee',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.export.name.capitalized,
          // description: 'Export list of employee',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
    FeatureModel(
      name: 'Employee Timesheet',
      // description: 'Allow all actions for employee timesheet',
      permissions: [
        PermissionModel(
          type: PermissionType.view.name.capitalized,
          // description: 'View all employee timesheet',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.export.name.capitalized,
          // description: 'Export the overview of all employee timesheet',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.export.name.capitalized,
          // description: 'Export an individual employee timesheet',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
    FeatureModel(
      name: 'Employee Activity Log',
      // description: 'Allow all actions for employee activity log',
      permissions: [
        PermissionModel(
          type: PermissionType.view.name.capitalized,
          // description: 'View all employee activity log',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.export.name.capitalized,
          // description: 'Export list of employee activity log',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
  ],
  isChecked: true,
);

final settingsControl = AccessControlModel(
  system: SystemAccess.portal,
  name: 'Settings',
  // description: 'Allow full access and control to all settings features',
  features: [
    FeatureModel(
      name: 'Tax',
      // description: 'Allow all actions for tax',
      permissions: [
        PermissionModel(
          type: PermissionType.view.name.capitalized,
          // description: 'View all tax code',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.create.name.capitalized,
          // description: 'Create new tax code',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.update.name.capitalized,
          // description: 'Edit existing tax code',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.delete.name.capitalized,
          // description: 'Delete existing tax code',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
    FeatureModel(
      name: 'Branch',
      // description: 'Allow all actions for branch',
      permissions: [
        PermissionModel(
          type: PermissionType.view.name.capitalized,
          // description: 'View all branch',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.create.name.capitalized,
          // description: 'Create new branch',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.update.name.capitalized,
          // description: 'Edit existing branch',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.delete.name.capitalized,
          // description: 'Delete existing branch',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
    FeatureModel(
      name: 'POS Register',
      // description: 'Allow all actions for POS register',
      permissions: [
        PermissionModel(
          type: PermissionType.view.name.capitalized,
          // description: 'View all POS register',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.create.name.capitalized,
          // description: 'Create new POS register',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.update.name.capitalized,
          // description: 'Edit existing POS register',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.delete.name.capitalized,
          // description: 'Delete existing POS register',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
    FeatureModel(
      name: 'Receipt Template',
      // description: 'Allow all actions for receipt template',
      permissions: [
        PermissionModel(
          type: PermissionType.view.name.capitalized,
          // description: 'View all receipt template',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.create.name.capitalized,
          // description: 'Create new receipt template',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.update.name.capitalized,
          // description: 'Edit existing receipt template',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.delete.name.capitalized,
          // description: 'Delete existing receipt template',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
  ],
  isChecked: true,
);

// supervisor
final po = AccessControlModel(
  system: SystemAccess.portal,
  name: 'Stock Management',
  // description: 'Allow full access and control to the following stock management features',
  features: [
    FeatureModel(
      name: 'Purchase Order',
      // description: 'Allow all actions for purchase order',
      permissions: [
        PermissionModel(
          type: PermissionType.view.name.capitalized,
          // description: 'View all purchase order',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.create.name.capitalized,
          // description: 'Create new purchase order',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.update.name.capitalized,
          // description: 'Edit, receive, complete or cancel existing purchase order',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.delete.name.capitalized,
          // description: 'Delete existing purchase order',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.print.name.capitalized,
          // description: 'Print purchase order invoice',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.export.name.capitalized,
          // description: 'Export list of purchase orders',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
  ],
  isChecked: true,
);

final supervisorRegister = AccessControlModel(
  system: SystemAccess.pos,
  name: 'Register',
  // description: 'Allow full access and control to the following POS register features',
  features: [
    FeatureModel(
      name: 'Sale',
      // description: 'Allow punching of orders, give discount, print receipts',
      permissions: [
        PermissionModel(
          type: PermissionType.create.name.capitalized,
          // description: 'Export list of purchase orders',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
    FeatureModel(
      name: 'Transactions',
      // description: 'View transactions, issue and approve refund request, re-print receipts',
      permissions: [
        PermissionModel(
          type: PermissionType.refund.name.capitalized,
          // description: 'Export list of purchase orders',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.authorize.name.capitalized,
          // description: 'Export list of purchase orders',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.print.name.capitalized,
          // description: 'Export list of purchase orders',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
  ],
  isChecked: true,
);

// cashier
final cashierRegister = AccessControlModel(
  system: SystemAccess.pos,
  name: 'Register',
  // description: 'Allow full access and control to the following POS register features',
  features: [
    FeatureModel(
      name: 'Sale',
      // description: 'Allow punching of orders, give discount, print receipts',
      permissions: [
        PermissionModel(
          type: PermissionType.create.name.capitalized,
          // description: 'Export list of purchase orders',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
    FeatureModel(
      name: 'Transactions',
      // description: 'View transactions, issue refund, re-print receipts',
      permissions: [
        PermissionModel(
          type: PermissionType.refund.name.capitalized,
          // description: 'Export list of purchase orders',
          isChecked: true,
        ),
        PermissionModel(
          type: PermissionType.print.name.capitalized,
          // description: 'Export list of purchase orders',
          isChecked: true,
        ),
      ],
      isChecked: true,
    ),
  ],
  isChecked: true,
);


  // final allModules = [
  //   Module(
  //     role: EmployeeRole.admin,
  //     system: SystemAccess.portal,
  //     name: 'Product Management',
      // description: 'Allow full access and control to all product management features',
  //     features: [
  //       Feature(
  //         name: 'Products and Variants',
          // description: 'Allow all actions for products and variants',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.view.name.capitalized,
  //             description: 'View all products',
  //             isChecked: false,
  //           ),
  //           Permission(
  //             type: PermissionType.create.name.capitalized,
  //             description: 'Create new products and variants',
  //             isChecked: false,
  //           ),
  //           Permission(
  //             type: PermissionType.update.name.capitalized,
  //             description: 'Edit existing products and variants',
  //             isChecked: false,
  //           ),
  //           Permission(
  //             type: PermissionType.delete.name.capitalized,
  //             description: 'Delete existing products and variants',
  //             isChecked: false,
  //           ),
  //           Permission(
  //             type: PermissionType.export.name.capitalized,
  //             description: 'Export list of products',
  //             isChecked: false,
  //           ),
  //         ],
  //         isChecked: false,
  //       ),
  //       Feature(
  //         feature: 'Suppliers',
  //         description: 'Allow all actions for suppliers',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.view.name.capitalized,
  //             description: 'View all suppliers',
  //             isChecked: false,
  //           ),
  //           Permission(
  //             type: PermissionType.create.name.capitalized,
  //             description: 'Create new suppliers',
  //             isChecked: false,
  //           ),
  //           Permission(
  //             type: PermissionType.update.name.capitalized,
  //             description: 'Edit existing suppliers',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.delete.name.capitalized,
  //             description: 'Delete existing suppliers',
  //             isAllowed: false,
  //           ),
  //         ],
  //         isChecked: false,
  //       ),
  //     ],
  //     isChecked: false,
  //   ),
  //   Module(
  //     role: EmployeeRole.admin,
  //     system: SystemAccess.portal,
  //     name: 'Stock Management',
  //     description: 'Allow full access and control to all stock management features',
  //     features: [
  //       Feature(
  //         feature: 'Supply Needs',
  //         description: 'Allow all actions for supply needs',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.view.name.capitalized,
  //             description: 'View all supply needs',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.create.name.capitalized,
  //             description: 'Create new purchase order or stock transfer from supply needs',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.export.name.capitalized,
  //             description: 'Export list of supply needs',
  //             isAllowed: false,
  //           ),
  //         ],
  //         hasFullAccess: false,
  //       ),
  //       Feature(
  //         feature: 'Purchase Order',
  //         description: 'Allow all actions for purchase order',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.view.name.capitalized,
  //             description: 'View all purchase order',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.create.name.capitalized,
  //             description: 'Create new purchase order',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.update.name.capitalized,
  //             description: 'Edit, receive, complete or cancel existing purchase order',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.delete.name.capitalized,
  //             description: 'Delete existing purchase order',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.print.name.capitalized,
  //             description: 'Print purchase order invoice',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.export.name.capitalized,
  //             description: 'Export list of purchase orders',
  //             isAllowed: false,
  //           ),
  //         ],
  //         hasFullAccess: false,
  //       ),
  //       Feature(
  //         feature: 'Stock Return',
  //         description: 'Allow all actions for stock return',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.view.name.capitalized,
  //             description: 'View all stock return',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.create.name.capitalized,
  //             description: 'Create new stock return',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.update.name.capitalized,
  //             description: 'Edit, complete existing stock return',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.delete.name.capitalized,
  //             description: 'Delete existing stock return',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.export.name.capitalized,
  //             description: 'Export list of stock returns',
  //             isAllowed: false,
  //           ),
  //         ],
  //         hasFullAccess: false,
  //       ),
  //       Feature(
  //         feature: 'Stock Take',
  //         description: 'Allow all actions for stock take',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.view.name.capitalized,
  //             description: 'View all stock take',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.create.name.capitalized,
  //             description: 'Create new stock take',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.update.name.capitalized,
  //             description: 'Edit, complete or cancel existing stock take',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.delete.name.capitalized,
  //             description: 'Delete existing stock take',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.export.name.capitalized,
  //             description: 'Export list of stock take',
  //             isAllowed: false,
  //           ),
  //         ],
  //         hasFullAccess: false,
  //       ),
  //       Feature(
  //         feature: 'Stock Transfer',
  //         description: 'Allow all actions for stock transfer',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.view.name.capitalized,
  //             description: 'View all stock transfer',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.create.name.capitalized,
  //             description: 'Create new stock transfer',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.update.name.capitalized,
  //             description: 'Edit, ship, receive, complete or cancel existing stock transfer',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.delete.name.capitalized,
  //             description: 'Delete existing stock transfer',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.export.name.capitalized,
  //             description: 'Export list of stock transfer',
  //             isAllowed: false,
  //           ),
  //         ],
  //         hasFullAccess: false,
  //       ),
  //     ],
  //     hasFullAccess: false,
  //   ),
  //   Module(
  //     role: EmployeeRole.admin,
  //     system: SystemAccess.portal,
  //     name: 'Transactions',
  //     description: 'Allow full access and control to all transaction features',
  //     features: [
  //       Feature(
  //         feature: 'Sales',
  //         description: 'Allow all actions for sales',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.view.name.capitalized,
  //             description: 'View all sale transaction',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.export.name.capitalized,
  //             description: 'Export list of sale transaction',
  //             isAllowed: false,
  //           ),
  //         ],
  //         hasFullAccess: false,
  //       ),
  //       Feature(
  //         feature: 'Return',
  //         description: 'Allow all actions for returns',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.view.name.capitalized,
  //             description: 'View all return transactions',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.update.name.capitalized,
  //             description: 'Process the items of the return transaction',
  //             isAllowed: false,
  //           ),
  //         ],
  //         hasFullAccess: false,
  //       ),
  //     ],
  //     hasFullAccess: false,
  //   ),
  //   Module(
  //     role: EmployeeRole.administrator,
  //     system: SystemAccess.portal,
  //     name: 'Reports',
  //     description: 'Allow full access and control to all report features',
  //     features: [
  //       Feature(
  //         feature: 'Product History',
  //         description: 'Allow all actions for product history',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.view.name.capitalized,
  //             description: 'View all product history',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.export.name.capitalized,
  //             description: 'Export list of product history',
  //             isAllowed: false,
  //           ),
  //         ],
  //         hasFullAccess: false,
  //       ),
  //       Feature(
  //         feature: 'Sales per Category',
  //         description: 'Allow all actions for sales per category',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.view.name.capitalized,
  //             description: 'View sales per category report',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.export.name.capitalized,
  //             description: 'Export sales per category report',
  //             isAllowed: false,
  //           ),
  //         ],
  //         hasFullAccess: false,
  //       ),
  //       Feature(
  //         feature: 'Sales per Shift',
  //         description: 'Allow all actions for sales per shift',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.view.name.capitalized,
  //             description: 'View sales per shift report',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.export.name.capitalized,
  //             description: 'Export sales per shift report',
  //             isAllowed: false,
  //           ),
  //         ],
  //         hasFullAccess: false,
  //       ),
  //       Feature(
  //         feature: 'Product Profit and Loss',
  //         description: 'Allow all actions for product profit and loss',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.create.name.capitalized,
  //             description: 'Generate product profit and loss report',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.export.name.capitalized,
  //             description: 'Export product profit and loss report',
  //             isAllowed: false,
  //           ),
  //         ],
  //         hasFullAccess: false,
  //       ),
  //       Feature(
  //         feature: 'ABC Analysis',
  //         description: 'Allow all actions for ABC analysis',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.create.name.capitalized,
  //             description: 'Generate ABC analysis report',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.export.name.capitalized,
  //             description: 'Export ABC analysis report',
  //             isAllowed: false,
  //           ),
  //         ],
  //         hasFullAccess: false,
  //       ),
  //       Feature(
  //         feature: 'Lot Expiration',
  //         description: 'Allow all actions for lot expiration',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.create.name.capitalized,
  //             description: 'View all lot expiration',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.export.name.capitalized,
  //             description: 'Export list of lot expiration',
  //             isAllowed: false,
  //           ),
  //         ],
  //         hasFullAccess: false,
  //       ),
  //     ],
  //     hasFullAccess: false,
  //   ),
  //   Module(
  //     role: EmployeeRole.administrator,
  //     system: SystemAccess.portal,
  //     name: 'Employees',
  //     description: 'Allow full access and control to all employee management features',
  //     features: [
  //       Feature(
  //         feature: 'Manage Employees',
  //         description: 'Allow all actions for employees',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.view.name.capitalized,
  //             description: 'View all employees',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.create.name.capitalized,
  //             description: 'Create new employee',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.update.name.capitalized,
  //             description: 'Edit existing employee',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.delete.name.capitalized,
  //             description: 'Delete existing employee',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.export.name.capitalized,
  //             description: 'Export list of employee',
  //             isAllowed: false,
  //           ),
  //         ],
  //         hasFullAccess: false,
  //       ),
  //       Feature(
  //         feature: 'Employee Timehsheet',
  //         description: 'Allow all actions for employee timesheet',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.view.name.capitalized,
  //             description: 'View all employee timesheet',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.export.name.capitalized,
  //             description: 'Export the overview of all employee timesheet',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.export.name.capitalized,
  //             description: 'Export an individual employee timesheet',
  //             isAllowed: false,
  //           ),
  //         ],
  //         hasFullAccess: false,
  //       ),
  //       Feature(
  //         feature: 'Employee Activity Log',
  //         description: 'Allow all actions for employee activity log',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.view.name.capitalized,
  //             description: 'View all employee activity log',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.export.name.capitalized,
  //             description: 'Export list of employee activity log',
  //             isAllowed: false,
  //           ),
  //         ],
  //         hasFullAccess: false,
  //       ),
  //     ],
  //     hasFullAccess: false,
  //   ),
  //   Module(
  //     role: EmployeeRole.administrator,
  //     system: SystemAccess.portal,
  //     name: 'Settings',
  //     description: 'Allow full access and control to all settings features',
  //     features: [
  //       Feature(
  //         feature: 'Tax',
  //         description: 'Allow all actions for tax',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.view.name.capitalized,
  //             description: 'View all tax code',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.create.name.capitalized,
  //             description: 'Create new tax code',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.update.name.capitalized,
  //             description: 'Edit existing tax code',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.delete.name.capitalized,
  //             description: 'Delete existing tax code',
  //             isAllowed: false,
  //           ),
  //         ],
  //         hasFullAccess: false,
  //       ),
  //       Feature(
  //         feature: 'Branch',
  //         description: 'Allow all actions for branch',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.view.name.capitalized,
  //             description: 'View all branch',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.create.name.capitalized,
  //             description: 'Create new branch',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.update.name.capitalized,
  //             description: 'Edit existing branch',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.delete.name.capitalized,
  //             description: 'Delete existing branch',
  //             isAllowed: false,
  //           ),
  //         ],
  //         hasFullAccess: false,
  //       ),
  //       Feature(
  //         feature: 'POS Register',
  //         description: 'Allow all actions for POS register',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.view.name.capitalized,
  //             description: 'View all POS register',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.create.name.capitalized,
  //             description: 'Create new POS register',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.update.name.capitalized,
  //             description: 'Edit existing POS register',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.delete.name.capitalized,
  //             description: 'Delete existing POS register',
  //             isAllowed: false,
  //           ),
  //         ],
  //         hasFullAccess: false,
  //       ),
  //       Feature(
  //         feature: 'Receipt Template',
  //         description: 'Allow all actions for receipt template',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.view.name.capitalized,
  //             description: 'View all receipt template',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.create.name.capitalized,
  //             description: 'Create new receipt template',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.update.name.capitalized,
  //             description: 'Edit existing receipt template',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.delete.name.capitalized,
  //             description: 'Delete existing receipt template',
  //             isAllowed: false,
  //           ),
  //         ],
  //         hasFullAccess: false,
  //       ),
  //     ],
  //     hasFullAccess: false,
  //   ),
  //   Module(
  //     role: EmployeeRole.cashier,
  //     system: SystemAccess.pos,
  //     name: 'Register',
  //     description: 'Allow full access and control to the following POS register features',
  //     features: [
  //       Feature(
  //         feature: 'Sale',
  //         description: 'Allow punching of orders, give discount, print receipts',
  //         permissions: [],
  //         hasFullAccess: false,
  //       ),
  //       Feature(
  //         feature: 'Transactions',
  //         description: 'View transactions, issue refund, re-print receipts',
  //         permissions: [],
  //         hasFullAccess: false,
  //       ),
  //     ],
  //     hasFullAccess: false,
  //   ),
  //   Module(
  //     role: EmployeeRole.supervisor,
  //     system: SystemAccess.pos,
  //     name: 'Register',
  //     description: 'Allow full access and control to the following POS register features',
  //     features: [
  //       Feature(
  //         feature: 'Sale',
  //         description: 'Allow punching of orders, give discount, print receipts',
  //         permissions: [],
  //         hasFullAccess: false,
  //       ),
  //       Feature(
  //         feature: 'Transactions',
  //         description: 'View transactions, issue and approve refund request, re-print receipts',
  //         permissions: [],
  //         hasFullAccess: false,
  //       ),
  //     ],
  //     hasFullAccess: false,
  //   ),
  //   Module(
  //     role: EmployeeRole.supervisor,
  //     system: SystemAccess.portal,
  //     name: 'Stock Management',
  //     description: 'Allow full access and control to the following stock management features',
  //     features: [
  //       Feature(
  //         feature: 'Purchase Order',
  //         description: 'Allow all actions for purchase order',
  //         permissions: [
  //           Permission(
  //             type: PermissionType.view.name.capitalized,
  //             description: 'View all purchase order',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.create.name.capitalized,
  //             description: 'Create new purchase order',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.update.name.capitalized,
  //             description: 'Edit, receive, complete or cancel existing purchase order',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.delete.name.capitalized,
  //             description: 'Delete existing purchase order',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.print.name.capitalized,
  //             description: 'Print purchase order invoice',
  //             isAllowed: false,
  //           ),
  //           Permission(
  //             type: PermissionType.export.name.capitalized,
  //             description: 'Export list of purchase orders',
  //             isAllowed: false,
  //           ),
  //         ],
  //         hasFullAccess: false,
  //       ),
  //     ],
  //     hasFullAccess: false,
  //   ),
  // ];