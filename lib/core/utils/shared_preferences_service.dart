import 'package:medglobal_admin_portal/core/enums/register_shift_enum.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/entities/user.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register_shift_detail.dart';
import 'package:medglobal_admin_portal/pos/register_shift/domain/entities/register_shift.dart';
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

  static Future<bool> clearPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
