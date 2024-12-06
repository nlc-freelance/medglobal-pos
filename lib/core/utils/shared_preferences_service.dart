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

  /// Branch where the selected register is assigned
  static Future<void> setRegisterBranchId(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('register_branch_id', value);
  }

  static Future<int?> getRegisterBranchId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('register_branch_id');
  }

  ///

  /// Shift status
  /// Register.shiftDetail [status]
  static Future<void> setShiftStatus(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('shift_status', value);
  }

  static Future<bool> isShiftOpen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('shift_status') ?? false;
  }

  static Future<void> clearShiftStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('shift_status');
  }

  /// Shift last opened at
  /// Register.shiftDetail [createdAt]
  static Future<void> setShiftLastOpenedAt(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('shift_last_opened_at', value);
  }

  static Future<String> getShiftLastOpenedAt() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('shift_last_opened_at') ?? '';
  }

  static Future<void> clearShiftOpenedAt() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('shift_last_opened_at');
  }

  /// Shift last closed at
  /// Register.shiftDetail [updatedAt]
  static Future<void> setShiftLastClosedAt(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('shift_last_closed_at', value);
  }

  static Future<String> getShiftLastClosedAt() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('shift_last_closed_at') ?? '';
  }

  static Future<void> clearShiftLastClosedAt() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('shift_last_closed_at');
  }

  ///

  static Future<bool> clearPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
