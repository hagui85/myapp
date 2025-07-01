import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failures.dart';



abstract class ConnectivityRepository {
  Future<Either<Failure, bool>> isConnected();
}