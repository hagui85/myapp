import 'package:myapp/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failures.dart';
import 'package:myapp/features/authentication/data/models/authentication_request.dart';
import 'package:myapp/features/authentication/domain/entities/authentication_entity.dart';
import 'package:myapp/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:myapp/features/authentication/data/datasources/authentication_local_data_source.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;
  final AuthenticationLocalDataSource localDataSource;

  AuthenticationRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, AuthenticationEntity>> loginUser(
    AuthenticationRequest authenticationRequest,
  ) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthenticationRequest>>
  fetchSavedAuthenticationRequestModel() async {
    try {
      final authenticationRequest = await localDataSource
          .getAuthenticationRequest();
      if (authenticationRequest != null) {
        return Right(authenticationRequest);
      } else {
        // Return a specific Failure for the case where the request is not found
        return Left(Failure("Authentication request not found in cache"));
      }
    } catch (e) {
      // Handle any potential exceptions during the local data source call
      return Left(
        Failure(
          "Error fetching authentication request from cache: ${e.toString()}",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AuthenticationEntity>> fetchCachedToken() async {
    try {
      final dynamic lastToken = await localDataSource.getLastToken();

      // You need to implement logic here to process the 'dynamic' result.
      // This might involve:
      // 1. Checking if the result is null or in an unexpected format.
      // 2. Casting or converting the result to an AuthenticationEntity.
      //    This depends on what getLastToken actually returns.
      //    For example, if it returns a String token:
      if (lastToken != null && lastToken is String) {
        // Assuming AuthenticationEntity can be created from a token string
        final authenticationEntity = AuthenticationEntity(token: lastToken);
        return Right(authenticationEntity);
      } else {
        // Handle cases where the result is null or not in the expected format
        return Left(Failure("Cached token not found or in invalid format"));
      }
    } catch (e) {
      // Handle any potential exceptions during the local data source call
      return Left(Failure("Error fetching cached token: ${e.toString()}"));
    }
  }
}
