import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const String isLoggedInKey = "IS_LOGGED_IN";
  static const String userNameKey = "USER_NAME";
  static const String userEmailKey = "USER_EMAIL";
  static const String userUidKey = "USER_UID";

  Future<void> saveUserDetails({
    required String uid,
    required String name,
    required String email,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isLoggedInKey, true);
    await prefs.setString(userUidKey, uid);
    await prefs.setString(userNameKey, name);
    await prefs.setString(userEmailKey, email);
  }

  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isLoggedInKey, false);
    await prefs.remove(userUidKey);
    await prefs.remove(userNameKey);
    await prefs.remove(userEmailKey);
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLoggedInKey) ?? false;
  }

  Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey);
  }

  Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmailKey);
  }

  Future<String?> getUserUid() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userUidKey);
  }
}
