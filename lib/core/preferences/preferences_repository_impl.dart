// lib/core/preferences/preferences_repository_impl.dart
import 'package:myapp/core/utils/shared_prefs_helper.dart'; // Adjust the import path if needed
import 'package:myapp/core/preferences/preferences_repository.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  final SharedPrefsHelper prefsHelper;
  static const String _tokenKey = 'auth_token';
  static const String _videoListKey = 'cached_video_list';
  static const String _imeiKey = 'imei';
  static const String _serialKey = 'serial_number';
  PreferencesRepositoryImpl(this.prefsHelper);

  @override
  Future<void> saveToken(String token) async {
    await prefsHelper.set<String>(_tokenKey, token);
  }

  @override
  String? getToken() {
    return prefsHelper.get<String>(_tokenKey);
  }

  @override
  Future<void> clearToken() async {
    await prefsHelper.remove(_tokenKey);
  }

  @override
  Future<void> saveVideoList(String json) async {
    await prefsHelper.set<String>(_videoListKey, json);
  }

  @override
  String? getCachedVideoList() {
    return prefsHelper.get<String>(_videoListKey);
  }

  @override
  Future<void> clearVideoList() async {
    await prefsHelper.remove(_videoListKey);
  }

  @override
  Future<void> saveImei(String imei) async {
    await prefsHelper.set<String>(_imeiKey, imei);
  }

  @override
  Future<void> saveSerial(String serial) async {
    await prefsHelper.set<String>(_serialKey, serial);
  }

  @override
  Future<String?> getImei() async {
    return prefsHelper.get<String>(_imeiKey);
  }

  @override
  Future<String?> getSerial() async {
    return prefsHelper.get<String>(_serialKey);
  }
}
