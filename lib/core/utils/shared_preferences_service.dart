import 'package:medglobal_admin_portal/core/enums/register_shift_enum.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/entities/user.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register_shift.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  /// Current logged in user
  static Future<void> setUserId(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user_id', value);
  }

  static Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('user_id');
  }

  /// Saves selected register and its shift details
  ///
  /// If the register's [shiftDetail] is null, the register is new.
  /// Therefore no need to persist the shift details as there is no recent record of a shift yet
  static Future<void> saveRegisterDetails(Register register) async {
    final prefs = await SharedPreferences.getInstance();

    /// Branch where the selected register is assigned
    await prefs.setInt('register_branch_id', register.assignedBranch!.id!);

    await prefs.setInt('register_id', register.id!);
    await prefs.setString('register_name', register.name);
    await prefs.setString(
      'register_status',
      register.shiftDetail?.status == 'open' ? RegisterShiftStatus.open.name : RegisterShiftStatus.close.name,
    );

    if (register.shiftDetail != null) {
      final shiftDetail = register.shiftDetail!;

      await prefs.setString('register_opened_at', shiftDetail.createdAt.toIso8601String());
      await prefs.setString('register_closed_at', shiftDetail.updatedAt.toIso8601String());
    }
  }

  static Future<void> updateRegisterShift(RegisterShift shift) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('register_status', shift.status);
    await prefs.setString('register_opened_at', shift.createdAt.toIso8601String());
    await prefs.setString('register_closed_at', shift.updatedAt.toIso8601String());
  }

  static Future<Map<String, dynamic>> getRegisterDetails() async {
    final prefs = await SharedPreferences.getInstance();

    final id = prefs.getInt('register_id');
    final name = prefs.getString('register_name');
    final status = prefs.getString('register_status');
    final openedAt = prefs.getString('register_opened_at');
    final closedAt = prefs.getString('register_closed_at');

    return {
      'id': id,
      'name': name,
      'status': status,
      'openedAt': openedAt != null ? DateTime.parse(openedAt) : null,
      'closedAt': closedAt != null ? DateTime.parse(closedAt) : null,
    };
  }

  static Future<int?> getRegisterId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('register_id');
  }

  static Future<int?> getRegisterBranchId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('register_branch_id');
  }

  static Future<bool> clearPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static Future<void> saveUserDetails(User user) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt('user_id', user.id!);
    await prefs.setString('user_first_name', user.firstName!);
    await prefs.setString('user_last_name', user.lastName!);
  }

  static Future<User> getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();

    final id = prefs.getInt('user_id');
    final firstName = prefs.getString('user_first_name');
    final lastName = prefs.getString('user_last_name');

    return User(
      id: id,
      firstName: firstName,
      lastName: lastName,
    );
    // return {'id': id, 'firstName': firstName, 'lastName': lastName};
  }
}
