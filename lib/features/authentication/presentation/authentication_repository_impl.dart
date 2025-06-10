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
  Future<Either<Failure, AuthenticationRequest>> fetchCachedToken() {
    // TODO: implement fetchCachedToken
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthenticationRequest>>
  fetchSavedAuthenticationRequestModel() {
    // TODO: implement fetchCatchAuthenticationRequestModel
    throw UnimplementedError();
  }
}
