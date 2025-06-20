// lib/core/preferences/preferences_repository.dart
abstract class PreferencesRepository {
  Future<void> saveToken(String token);
  String? getToken();
  Future<void> clearToken();
}
