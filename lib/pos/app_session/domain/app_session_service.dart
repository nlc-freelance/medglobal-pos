import 'package:medglobal_admin_portal/portal/authentication/domain/entities/user.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/entities/app_session.dart';
import 'package:medglobal_admin_portal/pos/receipt_config/domain/entities/receipt_configuration.dart';

class AppSessionService {
  User? _user;
  Register? _register;
  ReceiptConfiguration? _receipt;
  String? _printer;

  void setUser(User user) => _user = user;
  void setReceiptConfig(ReceiptConfiguration config) => _receipt = config;
  void setPrinter(String printer) => _printer = printer;

  void setAppSession(User user, Register register, ReceiptConfiguration receipt) {
    _user = user;
    _register = register;
    _receipt = receipt;
  }

  void clear() {
    _user = null;
    _register = null;
    _receipt = null;
  }

  User? get user => _user;
  int? get userId => _user?.id;
  int? get registerId => _register?.id;
  int? get branchId => _register?.assignedBranch?.id;
  ReceiptConfiguration? get receiptConfig => _receipt;
  String? get printer => _printer;

  AppSession? get session {
    if (_user == null || _register == null || receiptConfig == null) return null;

    return AppSession(
      employeeId: _user!.id!,
      employeeFirstName: _user!.firstName!,
      employeeLastName: _user!.lastName!,
      registerId: _register!.id!,
      registerName: _register!.name,
      registerSerialNo: _register!.serialNumber!,
      branchId: _register!.assignedBranch!.id!,
      branchName: _register!.assignedBranch!.name,
      receiptConfig: _receipt!,
    );
  }
}
