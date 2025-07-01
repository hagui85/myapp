import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failures.dart';
import 'package:myapp/features/splash/domain/repositories/connectivity_repository.dart';



class ConnectivityRepositoryImpl implements ConnectivityRepository {

  final Connectivity _connectivity;

  ConnectivityRepositoryImpl(this._connectivity);

  @override
  Future<Either<Failure, bool>> isConnected() async {
    var result = await _connectivity.checkConnectivity();

    if (result != ConnectivityResult.none) {
      return const Right(true);
    } else {
      return const Left(Failure("Internet not connected"));
    }
  }
}
