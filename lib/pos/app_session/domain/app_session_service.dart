import 'package:medglobal_admin_portal/portal/authentication/domain/entities/user.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/entities/app_session.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/receipt_configuration.dart';

class AppSessionService {
  User? _user;
  RegisterPartial? _register;
  BranchPartial? _branch;
  ReceiptConfiguration? _receipt;
  String? _printer;

  void setUser(User user) => _user = user;
  void setReceiptConfig(ReceiptConfiguration config) => _receipt = config;
  void setPrinter(String? printer) => _printer = printer;

  // void setAppSession(User user, Register register, ReceiptConfiguration receipt) {
  //   _user = user;
  //   _register = register;
  //   _receipt = receipt;
  // }

  void setDeviceSettings(
    RegisterPartial register,
    BranchPartial branch,
    ReceiptConfiguration receipt,
    String? printer,
  ) {
    _register = register;
    _branch = branch;
    _receipt = receipt;
    _printer = printer;
  }

  void clear() {
    _user = null;
    _register = null;
    _receipt = null;
  }

  User? get user => _user;
  int? get userId => _user?.id;
  int? get registerId => _register?.id;
  String? get registerName => _register?.name;
  int? get branchId => _branch?.id;
  String? get branchName => _branch?.name;
  ReceiptConfiguration? get receiptConfig => _receipt;
  String? get printer => _printer;

  AppSession? get session {
    if (_user == null || _register == null || _branch == null || receiptConfig == null) return null;

    return AppSession(
      employeeId: _user!.id!,
      employeeFirstName: _user!.firstName!,
      employeeLastName: _user!.lastName!,
      registerId: _register!.id,
      registerName: _register!.name,
      registerSerialNo: _register!.serialNumber!,
      branchId: _branch!.id,
      branchName: _branch!.name,
      receiptConfig: _receipt!,
    );
  }
}
