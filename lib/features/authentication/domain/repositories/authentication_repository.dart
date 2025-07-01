import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failures.dart';
import 'package:myapp/features/authentication/data/models/authentication_request.dart';
import 'package:myapp/features/authentication/domain/entities/authentication_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, AuthenticationEntity>> loginUser(
    AuthenticationRequest authenticationRequest,
  );

  Future<Either<Failure, AuthenticationEntity>> fetchCachedToken();

  Future<Either<Failure, AuthenticationRequest>>
  fetchSavedAuthenticationRequestModel();
}
