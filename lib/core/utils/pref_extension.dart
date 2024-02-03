import 'package:shared_preferences/shared_preferences.dart';

extension PreferencesExtension on SharedPreferences {
  Future<bool> setStringOrClear(String key, String? value) async {
     if (value == null) {
       return await remove(key);
     }

     return await setString(key, value);
  }

  Future<bool> setIntOrClear(String key, int? value) {
    if (value == null) {
      return remove(key);
    }

    return setInt(key, value);
  }

  Future<bool> setBoolOrClear(String key, bool? value) {
    if (value == null) {
      return remove(key);
    }

    return setBool(key, value);
  }
}
