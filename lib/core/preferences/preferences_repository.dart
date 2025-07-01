// lib/core/preferences/preferences_repository.dart
abstract class PreferencesRepository {
  Future<void> saveToken(String token);
  String? getToken();
  Future<void> clearToken();

  Future<void> saveVideoList(String json);
  String? getCachedVideoList();
  Future<void> clearVideoList();

  Future<String?> getImei();
  Future<String?> getSerial();
  Future<void> saveImei(String imei);
  Future<void> saveSerial(String serial);
}
