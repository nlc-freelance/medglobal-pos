import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static Future<void> setShiftStatus(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_shift_open', value);
  }

  static Future<bool> isShiftOpen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_shift_open') ?? false;
  }

  static Future<void> setShiftOpenAt(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('shift_open_at', value);
  }

  static Future<String> getShiftOpenSince() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('shift_open_at') ?? '';
  }

  static Future<void> setShiftClosedAt(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('shift_closed_at', value);
  }

  static Future<String> getShiftClosedSince() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('shift_closed_at') ?? '';
  }

  static Future<void> setHasReachedMaxShiftOpen(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_max_shift_open', value);
  }

  static Future<bool> isMaxShiftOpenReached() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_max_shift_open') ?? false;
  }

  static Future<bool> clearPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
