// lib/core/preferences/preferences_repository_impl.dart
import 'package:myapp/core/utils/shared_prefs_helper.dart'; // Adjust the import path if needed
import 'package:myapp/core/preferences/preferences_repository.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  final SharedPrefsHelper prefsHelper;
  static const String _tokenKey = 'auth_token';

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
}
