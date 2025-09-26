import 'dart:convert';

import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/receipt_configuration.dart';

/// DeviceContext is a globally accessible cache that hold the current device-bound settings:
/// - The [Register] linked to this device
/// - The [Branch] associated with the register
/// - The [ReceiptConfig] and [Printer] used for POS operations
///
/// This is meant to act as an in-memory cache of the logged-in user's
/// information during the lifetime of the app. It should be updated
/// whenever the authentication state changes (login, logout, refresh/restart).
class DeviceContext {
  RegisterPartial? register;
  BranchPartial? branch;
  ReceiptConfiguration? receiptConfig;
  String? printer;

  /// Load data from the stored [SettingsModel].
  void loadFromModel(SettingsModel model) {
    register = model.register;
    branch = model.branch;
    receiptConfig = model.receiptConfig == null
        ? null
        : ReceiptConfiguration.fromJson(
            jsonDecode(model.receiptConfig!),
          );
    printer = model.printer;
  }

  /// Clear all cached data (e.g., on logout or unbind).
  void clear() {
    register = null;
    branch = null;
    receiptConfig = null;
    printer = null;
  }
}
