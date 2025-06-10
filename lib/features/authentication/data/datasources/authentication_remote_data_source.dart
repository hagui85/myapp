import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failures.dart';
import 'package:myapp/features/authentication/data/models/authentication_model.dart';
import 'package:myapp/features/authentication/data/models/authentication_request.dart';

// Assuming you use Dio for network requests
abstract class AuthenticationRemoteDataSource {
  Future<Either<Failure, AuthenticationModel>> loginUser(
    AuthenticationRequest authenticationRequest,
  );
}
