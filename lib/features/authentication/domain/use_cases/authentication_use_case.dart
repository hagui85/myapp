import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failures.dart';
import 'package:myapp/core/preferences/preferences_repository.dart';
import 'package:myapp/core/usecases/usecases.dart';
import 'package:myapp/features/authentication/data/models/authentication_request.dart';
import 'package:myapp/features/authentication/data/models/login_params.dart';
import 'package:myapp/features/authentication/domain/entities/authentication_entity.dart';
import 'package:myapp/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationUseCase
    implements UseCase<AuthenticationEntity, LoginParams> {
  final AuthenticationRepository repository;
  final PreferencesRepository preferencesRepository;

  AuthenticationUseCase({
    required this.repository,
    required this.preferencesRepository,
  });

  @override
  Future<Either<Failure, AuthenticationEntity>> call(LoginParams params) async {
    ///PSM to test if null or web
    final String imei =
        await preferencesRepository.getImei() ?? '351060890029290';
    final String snPsm =
        await preferencesRepository.getSerial() ?? '24211524201730';

    // Construire AuthenticationRequest complet
    final authRequest = AuthenticationRequest(
      login: params.login,
      password: params.password,
      imei: imei,
      snPsm: snPsm,
      badgeAlgoKey: "101",
      context: "",
      uuid: "",
      loginDate: AuthenticationRequest.getFormattedDate(),
      timestamp: AuthenticationRequest.generateTimestamp(imei),
      degradedToken: "",
      applicationIdentifier: "",
      fullDegradedAuth: false,
      // autres champs si besoin
    );
    return await repository.loginUser(authRequest);
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
