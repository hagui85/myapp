// lib/core/utils/shared_prefs_helper.dart
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  final SharedPreferences prefs;

  SharedPrefsHelper(this.prefs);

  Future<void> set<T>(String key, T value) async {
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      throw UnsupportedError("Unsupported type: $T");
    }
  }

  T? get<T>(String key) {
    final value = prefs.get(key);
    return value is T ? value : null;
  }

  Future<void> remove(String key) async => await prefs.remove(key);
  Future<void> clear() async => await prefs.clear();
  bool contains(String key) => prefs.containsKey(key);
}
