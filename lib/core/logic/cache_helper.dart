import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get phone {
    return _prefs.getString("phone") ?? "";
  }

  static String get password {
    return _prefs.getString("password") ?? "";
  }
  static String get fcmToken {
    return _prefs.getString("fcmToken") ?? "";
  }

  static bool get isAuth {
    return _prefs.getBool("isAuth") ?? false;
  }

  static setIsAuth() async {
    await _prefs.setBool("isAuth", true);
  }

  static setPhone(String value) async {
    await _prefs.setString("phone", value);
  }
  static setFCMToken(String value) async {
    await _prefs.setString("fcmToken", value);
  }

  static setPassword(String value) async {
    await _prefs.setString("password", value);
  }

  static logout() async {
    await _prefs.remove("isAuth");
  }
}
