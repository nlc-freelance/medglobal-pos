import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  /// Current logged in user
  static Future<void> setAccessToken(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', value);
  }

  static Future<String> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token') ?? '';
  }

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

  /// Shift opened since
  /// Register.shiftDetail [createdAt]
  static Future<void> setShiftOpenSince(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('shift_open_since', value);
  }

  static Future<String> getShiftOpenSince() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('shift_open_since') ?? '';
  }

  static Future<void> clearShiftOpenSince() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('shift_open_since');
  }

  /// Shift closed since
  /// Register.shiftDetail [updatedAt]
  static Future<void> setShiftClosedSince(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('shift_closed_since', value);
  }

  static Future<String> getShiftClosedSince() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('shift_closed_since') ?? '';
  }

  static Future<void> clearShiftClosedSince() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('shift_closed_since');
  }

  /// Maximum shift opening in one day
  static Future<void> setHasReachedMaxShift(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('has_max_shift', value);
  }

  static Future<bool> hasReachedMaxShift() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('has_max_shift') ?? false;
  }

  static Future<void> clearMaxShift() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('has_max_shift');
  }

  ///

  static Future<bool> clearPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
