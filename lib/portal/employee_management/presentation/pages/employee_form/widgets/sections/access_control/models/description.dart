import 'package:medglobal_admin_portal/core/core.dart';

class ModuleInfo {
  final String key;
  final String description;
  final List<FeatureInfo> features;

  const ModuleInfo({
    required this.key,
    required this.description,
    required this.features,
  });
}

class FeatureInfo {
  final String key;
  final String description;
  final List<PermissionInfo> permissions;

  const FeatureInfo({
    required this.key,
    required this.description,
    required this.permissions,
  });
}

class PermissionInfo {
  final String key;
  final String description;

  const PermissionInfo({required this.key, required this.description});
}

class AccessControlDescription {
  static String module(String moduleKey) {
    final module = _descriptions.firstWhereOrNull((m) => m.key == moduleKey);
    return module?.description ?? Strings.noValue;
  }

  static String feature(String moduleKey, String featureKey) {
    final module = _descriptions.firstWhereOrNull((m) => m.key == moduleKey);
    final feature = module?.features.firstWhereOrNull((f) => f.key == featureKey);
    return feature?.description ?? Strings.noValue;
  }

  static String permission(String moduleKey, String featureKey, String permissionKey) {
    final module = _descriptions.firstWhereOrNull((m) => m.key == moduleKey);
    final feature = module?.features.firstWhereOrNull((f) => f.key == featureKey);
    final permission = feature?.permissions.firstWhereOrNull((p) => p.key == permissionKey);
    return permission?.description ?? Strings.noValue;
  }

  static const _descriptions = [
    // Product Management
    ModuleInfo(
      key: 'Product Management',
      description: 'Allow full access and control to the following product management features',
      features: [
        FeatureInfo(
          key: 'Products',
          description: 'Allow the following permissions for products',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view products'),
            PermissionInfo(key: 'create', description: 'Can create new products'),
            PermissionInfo(key: 'update', description: 'Can edit existing product details'),
            PermissionInfo(key: 'delete', description: 'Can delete products'),
            PermissionInfo(key: 'export', description: 'Can export list of products'),
          ],
        ),
        FeatureInfo(
          key: 'Suppliers',
          description: 'Allow the following permissions for suppliers',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view suppliers'),
            PermissionInfo(key: 'create', description: 'Can create new suppliers'),
            PermissionInfo(key: 'update', description: 'Can edit existing supplier details'),
            PermissionInfo(key: 'delete', description: 'Can delete suppliers'),
          ],
        ),
      ],
    ),
    // Stock Management
    ModuleInfo(
      key: 'Stock Management',
      description: 'Allow full access and control to the following stock management features',
      features: [
        FeatureInfo(
          key: 'Supply Needs',
          description: 'Allow the following permissions for supply needs',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view supply needs'),
            PermissionInfo(
                key: 'create', description: 'Can create new purchase order or stock transfer from supply needs'),
            PermissionInfo(key: 'export', description: 'Can export list of supply needs'),
          ],
        ),
        FeatureInfo(
          key: 'Purchase Order',
          description: 'Allow the following permissions for purchase orders',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view purchase orders'),
            PermissionInfo(key: 'create', description: 'Can create new purchase orders'),
            PermissionInfo(key: 'update', description: 'Can edit existing purchase order details'),
            PermissionInfo(key: 'delete', description: 'Can delete purchase orders'),
            PermissionInfo(key: 'print', description: 'Can print purchase order invoices'),
            PermissionInfo(key: 'export', description: 'Can export list of purchase orders'),
          ],
        ),
        FeatureInfo(
          key: 'Stock Return',
          description: 'Allow the following permissions for stock returns',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view stock returns'),
            PermissionInfo(key: 'create', description: 'Can create new stock returns'),
            PermissionInfo(key: 'update', description: 'Can edit existing stock return details'),
            PermissionInfo(key: 'delete', description: 'Can delete stock returns'),
            PermissionInfo(key: 'export', description: 'Can export list of stock returns'),
          ],
        ),
        FeatureInfo(
          key: 'Stock Take',
          description: 'Allow the following permissions for stock takes',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view stock takes'),
            PermissionInfo(key: 'create', description: 'Can create new stock takes'),
            PermissionInfo(key: 'update', description: 'Can edit existing stock take details'),
            PermissionInfo(key: 'delete', description: 'Can delete stock takes'),
            PermissionInfo(key: 'export', description: 'Can export list of stock takes'),
          ],
        ),
        FeatureInfo(
          key: 'Stock Transfer',
          description: 'Allow the following permissions for stock transfers',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view stock transfers'),
            PermissionInfo(key: 'create', description: 'Can create new stock transfers'),
            PermissionInfo(key: 'update', description: 'Can edit existing stock transfer details'),
            PermissionInfo(key: 'delete', description: 'Can delete stock transfers'),
            PermissionInfo(key: 'export', description: 'Can export list of stock transfers'),
          ],
        ),
      ],
    ),
// Transactions
    ModuleInfo(
      key: 'Transactions',
      description: 'Allow full access and control to the following transaction features',
      features: [
        FeatureInfo(
          key: 'Sales',
          description: 'Allow the following permissions for sale transactions',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view sale transactions'),
            PermissionInfo(key: 'export', description: 'Can export list of sale transactions'),
          ],
        ),
        FeatureInfo(
          key: 'Returns',
          description: 'Allow the following permissions for return transactions',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view return transactions'),
            PermissionInfo(key: 'update', description: 'Can process return transaction items'),
          ],
        ),
      ],
    ),
    // Reports
    ModuleInfo(
      key: 'Reports',
      description: 'Allow full access and control to the following report features',
      features: [
        FeatureInfo(
          key: 'Product History',
          description: 'Allow the following permissions for product history',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view product history'),
            PermissionInfo(key: 'export', description: 'Can export product history report'),
          ],
        ),
        FeatureInfo(
          key: 'Sales per Category',
          description: 'Allow the following permissions for sales per category',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view sales per category'),
            PermissionInfo(key: 'export', description: 'Can export sales per category report'),
          ],
        ),
        FeatureInfo(
          key: 'Sales per Category',
          description: 'Allow the following permissions for sales per category',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view sales per category'),
            PermissionInfo(key: 'export', description: 'Can export sales per category report'),
          ],
        ),
        FeatureInfo(
          key: 'Sales per Shift',
          description: 'Allow the following permissions for sales per shift',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view sales per shift'),
            PermissionInfo(key: 'export', description: 'Can export sales per shift report'),
          ],
        ),
        FeatureInfo(
          key: 'Product Profit and Loss',
          description: 'Allow the following permissions for product profit and loss',
          permissions: [
            PermissionInfo(key: 'create', description: 'Can generate a product profit and loss report'),
            PermissionInfo(key: 'export', description: 'Can export product profit and loss report'),
          ],
        ),
        FeatureInfo(
          key: 'ABC Analysis',
          description: 'Allow the following permissions for ABC Analysis',
          permissions: [
            PermissionInfo(key: 'create', description: 'Can generate an ABC Analysis report'),
            PermissionInfo(key: 'export', description: 'Can export ABC Analysis report'),
          ],
        ),
        FeatureInfo(
          key: 'Lot Expirations',
          description: 'Allow the following permissions for lot expirations',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view lot expirations'),
            PermissionInfo(key: 'export', description: 'Can export lot expirations report'),
          ],
        ),
      ],
    ),

    // Employee Management
    ModuleInfo(
      key: 'Employees',
      description: 'Allow full access and control to the following employee management features',
      features: [
        FeatureInfo(
          key: 'Manage Employees',
          description: 'Allow the following actions for employees',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view employees'),
            PermissionInfo(key: 'create', description: 'Can create new employees'),
            PermissionInfo(key: 'update', description: 'Can edit existing employee details'),
            PermissionInfo(key: 'delete', description: 'Can delete employees'),
            PermissionInfo(key: 'export', description: 'Can export list of employees'),
          ],
        ),
        FeatureInfo(
          key: 'Employee Timesheet',
          description: 'Allow the following actions for employee timesheet',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view employee timesheet'),
            PermissionInfo(key: 'export', description: 'Can export overview of all employee timesheet'),
            PermissionInfo(key: 'export', description: 'Can export an employee timesheet'),
          ],
        ),
        FeatureInfo(
          key: 'Employee Activity Log',
          description: 'Allow the following actions for employee activity log',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view employee activity log'),
            PermissionInfo(key: 'export', description: 'Can export list of employee activity log'),
          ],
        )
      ],
    ),

    // Settings Management
    ModuleInfo(
      key: 'Settings',
      description: 'Allow full access and control to the following settings features',
      features: [
        FeatureInfo(
          key: 'Tax',
          description: 'Allow the following actions for tax codes',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view tax codes'),
            PermissionInfo(key: 'create', description: 'Can create new tax codes'),
            PermissionInfo(key: 'update', description: 'Can edit existing tax code details'),
            PermissionInfo(key: 'delete', description: 'Can delete tax codes'),
          ],
        ),
        FeatureInfo(
          key: 'Branch',
          description: 'Allow the following actions for branch',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view branches'),
            PermissionInfo(key: 'create', description: 'Can create new branches'),
            PermissionInfo(key: 'update', description: 'Can edit existing branch details'),
            PermissionInfo(key: 'delete', description: 'Can delete branches'),
          ],
        ),
        FeatureInfo(
          key: 'POS Register',
          description: 'Allow the following actions for register',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view registers'),
            PermissionInfo(key: 'create', description: 'Can create new registers'),
            PermissionInfo(key: 'update', description: 'Can edit existing register details'),
            PermissionInfo(key: 'delete', description: 'Can delete registers'),
          ],
        ),
        FeatureInfo(
          key: 'Receipt Template',
          description: 'Allow the following actions for receipt template',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view receipt templates'),
            PermissionInfo(key: 'create', description: 'Can create new receipt templates'),
            PermissionInfo(key: 'update', description: 'Can edit existing receipt template details'),
            PermissionInfo(key: 'delete', description: 'Can delete receipt templates'),
          ],
        ),
      ],
    ),

    // POS
    ModuleInfo(
      key: 'Register',
      description: 'Allow full access and control to the following POS Register features',
      features: [
        FeatureInfo(
          key: 'Sale',
          description: 'Allow the following actions for point of sale',
          permissions: [
            PermissionInfo(
                key: 'create', description: 'Can process a sale- punch orders, give discount, print receipts'),
          ],
        ),
        FeatureInfo(
          key: 'Transactions',
          description: 'Allow the following actions for POS transactions',
          permissions: [
            PermissionInfo(key: 'view', description: 'Can view transactions'),
            PermissionInfo(key: 'refund', description: 'Can initiate a refund (For approval)'),
            PermissionInfo(key: 'authorize', description: 'Can authorize refund request'),
            PermissionInfo(key: 'print', description: 'Can re-print receipts'),
          ],
        ),
      ],
    ),
  ];
}
