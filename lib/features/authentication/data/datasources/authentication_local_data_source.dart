import 'package:myapp/features/authentication/data/models/authentication_model.dart';

abstract class AuthenticationLocalDataSource {
  Future<void> cacheAuthenticationResponse(AuthenticationModel authentication);
}
