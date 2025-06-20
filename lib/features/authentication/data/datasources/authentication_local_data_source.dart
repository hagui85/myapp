import 'package:myapp/features/authentication/data/models/authentication_model.dart';
import 'package:myapp/features/authentication/data/models/authentication_request.dart';

abstract class AuthenticationLocalDataSource {
  Future<void> cacheAuthenticationResponse(AuthenticationModel authentication);
  Future<AuthenticationModel?> getCachedAuthenticationResponse();
  Future<void> cacheAuthenticationRequest(
    AuthenticationRequest authenticationRequest,
  );
  Future<AuthenticationRequest?> getAuthenticationRequest();

  Future<dynamic> getLastToken() async {}
}
