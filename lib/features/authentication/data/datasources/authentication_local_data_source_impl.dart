import 'dart:convert';
import 'package:myapp/core/preferences/preferences_repository.dart';
import 'package:myapp/features/authentication/data/datasources/authentication_local_data_source.dart';
import 'package:myapp/features/authentication/data/models/authentication_request.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/features/authentication/data/models/authentication_model.dart';

class AuthenticationLocalDataSourceImpl
    implements AuthenticationLocalDataSource {
  static const String _cachedAuthenticationKey =
      'cached_authentication_response';
  static const String _cachedAuthenticationRequestKey =
      'cached_authentication_request';
  final SharedPreferences sharedPreferences;
  final PreferencesRepository preferencesRepository;

  AuthenticationLocalDataSourceImpl({
    required this.sharedPreferences,
    required this.preferencesRepository,
  });

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

  /// Caches the authentication response in local storage.
  @override
  Future<void> cacheAuthenticationResponse(AuthenticationModel authentication) {
    final jsonString = json.encode(authentication.toJson());
    return sharedPreferences.setString(_cachedAuthenticationKey, jsonString);
  }

  @override
  /// Retrieves the cached authentication response from local storage.
  Future<AuthenticationModel?> getCachedAuthenticationResponse() async {
    final jsonString = sharedPreferences.getString(_cachedAuthenticationKey);
    if (jsonString != null) {
      return AuthenticationModel.fromJson(json.decode(jsonString));
    }
    return null;
  }

  @override
  /// Caches the authentication request in local storage.
  Future<void> cacheAuthenticationRequest(
    AuthenticationRequest authenticationRequest,
  ) {
    final jsonString = json.encode(authenticationRequest.toJson());
    return sharedPreferences.setString(
      _cachedAuthenticationRequestKey,
      jsonString,
    );
  }

  /// Gets the cached authentication request from local storage.
  @override
  Future<AuthenticationRequest?> getAuthenticationRequest() async {
    final jsonString = sharedPreferences.getString(
      _cachedAuthenticationRequestKey,
    );
    if (jsonString != null) {
      return AuthenticationRequest.fromJson(json.decode(jsonString));
    }
    return null;
  }

  @override
  Future getLastToken() {
    // TODO: implement getLastToken
    throw UnimplementedError();
  }
}
