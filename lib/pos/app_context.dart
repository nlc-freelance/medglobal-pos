import 'dart:convert';

import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/entities/user.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/receipt_configuration.dart';

/// AppContext is a globally accessible cache that hold the current app context:
/// AuthSession:
/// - The [User] currently logged in
/// DeviceSettings:
/// - The [Register] linked to this device
/// - The [Branch] associated with the register
/// - The [ReceiptConfiguration] and [Printer] used for POS operations
///
/// This is meant to act as an in-memory cache of the logged-in user's
/// information during the lifetime of the app. It should be updated
/// whenever the authentication state changes (login, logout, refresh/restart).
class AppContext {
  // RegisterPartial? register;
  // BranchPartial? branch;
  // ReceiptConfiguration? receiptConfig;
  // String? printer;
  // User? user;

  // void loadDeviceSettings(SettingsModel model) {
  //   register = model.register;
  //   branch = model.branch;
  //   receiptConfig = model.receiptConfig == null
  //       ? null
  //       : ReceiptConfiguration.fromJson(
  //           jsonDecode(model.receiptConfig!),
  //         );
  //   printer = model.printer;
  // }
  //
  // void loadAuthSession(SessionModel model) {
  //   user = User(
  //     id: model.employeeId,
  //     firstName: model.employeeFirstName,
  //     lastName: model.employeeLastName,
  //   );
  // }

  // Auth / Session data
  User? user;
  String? token;

  bool get isAuthenticated => user != null;

  // Device / Register data
  RegisterPartial? register;
  BranchPartial? branch;
  ReceiptConfiguration? receiptConfig;
  String? printer;

  /// Returns `true` if the device is bound to a register + branch & has receipt config
  bool get isDeviceBound => register != null && branch != null && hasReceiptConfig;

  /// Returns `true` if receipt config is loaded
  bool get hasReceiptConfig => receiptConfig != null;

  /// Returns `true` if printer config is loaded
  bool get hasPrinterConfig => printer != null;

  /// Returns `true` if app is fully initialized for POS usage
  bool get isReady => isAuthenticated && isDeviceBound;

  /// Load session (after login or restore)
  void loadSession(User user, String token) {
    this.user = user;
    this.token = token;
  }

  /// Bind device to a register + branch and receipt config
  void bindDevice(RegisterPartial register, BranchPartial branch, ReceiptConfiguration receiptConfig) {
    this.register = register;
    this.branch = branch;
    this.receiptConfig = receiptConfig;
  }

  /// Clear everything (e.g. on logout)
  void clear() {
    user = null;
    token = null;
    register = null;
    branch = null;
    receiptConfig = null;
    printer = null;
  }
}
