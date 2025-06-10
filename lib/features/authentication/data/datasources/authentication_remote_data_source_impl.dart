import 'package:dartz/dartz.dart';
import 'package:myapp/core/api/dio_client.dart';
import 'package:myapp/core/error/failures.dart';
import 'package:myapp/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:myapp/features/authentication/data/models/authentication_model.dart';
import 'package:myapp/features/authentication/data/models/authentication_request.dart';

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final DioClient dio;

  AuthenticationRemoteDataSourceImpl({required this.dio});

  @override
  Future<Either<Failure, AuthenticationModel>> loginUser(
    AuthenticationRequest authenticationRequest,
  ) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }
}

class ServerException {}
