import 'dart:convert';
import 'package:myapp/features/authentication/data/datasources/authentication_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/features/authentication/data/models/authentication_model.dart';

// Assuming you have a failures.dart file

class AuthenticationLocalDataSourceImpl
    implements AuthenticationLocalDataSource {
  static const String _cachedAuthenticationKey =
      'cached_authentication_response';
  final SharedPreferences sharedPreferences;

  AuthenticationLocalDataSourceImpl({required this.sharedPreferences});

  Future<void> saveAuthentication(AuthenticationModel authentication) {
    final jsonString = json.encode(authentication.toJson());
    return sharedPreferences.setString(_cachedAuthenticationKey, jsonString);
  }

  Future<AuthenticationModel?> getAuthentication() async {
    final jsonString = sharedPreferences.getString(_cachedAuthenticationKey);
    if (jsonString != null) {
      return AuthenticationModel.fromJson(json.decode(jsonString));
    }
    return null;
  }

  @override
  Future<void> cacheAuthenticationResponse(AuthenticationModel authentication) {
    // TODO: implement cacheAuthenticationResponse
    throw UnimplementedError();
  }
}
