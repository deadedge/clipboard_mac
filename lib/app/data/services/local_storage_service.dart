import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  Future<void> saveString(String key, String value) async {
    return await asyncPrefs.setString(key, value);
  }

  Future<void> saveBool(String key, bool value) async {
    return await asyncPrefs.setBool(key, value);
  }

  Future<void> delete(String key) async {
    return await asyncPrefs.remove(key);
  }

  Future<String?> getString(String key) async {
    final String? saveContent = await asyncPrefs.getString(key);
    if (saveContent == null) return null;

    return saveContent;
  }

  Future<bool?> getBool(String key) async {
    final bool? saveContent = await asyncPrefs.getBool(key);
    if (saveContent == null) return null;

    return saveContent;
  }
}
