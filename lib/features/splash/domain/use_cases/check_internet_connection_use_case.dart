import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failures.dart';
import 'package:myapp/core/usecases/usecases.dart';
import 'package:myapp/features/splash/domain/repositories/connectivity_repository.dart';

class CheckInternetConnectionUseCase extends UseCase<bool, NoParams> {
  final ConnectivityRepository connectivityRepository;

  CheckInternetConnectionUseCase(this.connectivityRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return connectivityRepository.isConnected();
  }
}
