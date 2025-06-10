import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failures.dart';
import 'package:myapp/core/usecases/usecases.dart';
import 'package:myapp/features/authentication/data/models/authentication_request.dart';
import 'package:myapp/features/authentication/domain/entities/authentication_entity.dart';
import 'package:myapp/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationUseCase
    implements UseCase<AuthenticationEntity, AuthenticationRequest> {
  final AuthenticationRepository repository;

  AuthenticationUseCase(this.repository);

  @override
  Future<Either<Failure, AuthenticationEntity>> call(
    AuthenticationRequest params,
  ) async {
    return await repository.loginUser(params);
  }
}

// You might also need use cases for fetching cached token and request
// class FetchCachedTokenUseCase implements UseCase<AuthenticationEntity, NoParams> {
//   final AuthenticationRepository repository;
//   FetchCachedTokenUseCase(this.repository);
//   @override
//   Future<Either<Failure, AuthenticationEntity>> call(NoParams params) async {
//     return await repository.fetchCachedToken();
//   }
// }

// class FetchCachedRequestUseCase implements UseCase<AuthenticationRequest, NoParams> {
//   final AuthenticationRepository repository;
//   FetchCachedRequestUseCase(this.repository);
//   @override
//   Future<Either<Failure, AuthenticationRequest>> call(NoParams params) async {
//     return await repository.fetchCatchAuthenticationRequestModel();
//   }
// }
