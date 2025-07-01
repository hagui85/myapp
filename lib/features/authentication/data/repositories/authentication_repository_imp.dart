import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failures.dart';
import 'package:myapp/features/authentication/data/datasources/authentication_local_data_source.dart';
import 'package:myapp/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:myapp/features/authentication/data/models/authentication_request.dart';
import 'package:myapp/features/authentication/domain/entities/authentication_entity.dart';
import 'package:myapp/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImp extends AuthenticationRepository {
  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;
  final AuthenticationLocalDataSource _authenticationLocalDataSource;

  AuthenticationRepositoryImp(
    this._authenticationRemoteDataSource,
    this._authenticationLocalDataSource,
  );

  @override
  Future<Either<Failure, AuthenticationEntity>> loginUser(
    AuthenticationRequest authenticationRequest,
  ) async {
    try {
      final result = await _authenticationRemoteDataSource.loginUser(
        authenticationRequest,
      );

      return result.fold((failure) => Left(failure), (
        authenticationResponseModel,
      ) {
        _authenticationLocalDataSource.cacheAuthenticationResponse(
          authenticationResponseModel,
        );
        return Right(authenticationResponseModel.toEntity());
      });
    } catch (e) {
      return Left(Failure('Authentication failed: $e'));
    }
  }

  @override
  Future<Either<Failure, AuthenticationEntity>> fetchCachedToken() async {
    try {
      final result = await _authenticationLocalDataSource.getLastToken();

      return result.fold(
        (failure) => Left(failure),
        (authenticationModel) => Right(authenticationModel.toEntity()),
      );
    } catch (e) {
      return Left(Failure('Token fetch failed: $e'));
    }
  }

  @override
  Future<Either<Failure, AuthenticationRequest>>
  fetchSavedAuthenticationRequestModel() async {
    try {
      final Either<Failure, AuthenticationRequest>? result =
          (await _authenticationLocalDataSource.getAuthenticationRequest())
              as Either<Failure, AuthenticationRequest>?;

      if (result == null) {
        return Left(Failure('No authentication request found'));
      }

      return result.fold(Left.new, Right.new);
    } catch (e) {
      return Left(Failure('Failed to fetch authentication request: $e'));
    }
  }
}
