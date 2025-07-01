import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failures.dart';
import 'package:myapp/core/usecases/usecases.dart';
import 'package:myapp/features/splash/data/models/splash_model.dart';

class SplashUseCase implements UseCase<SplashModel, NoParams> {
  @override
  Future<Either<Failure, SplashModel>> call(NoParams params) {
    throw UnimplementedError();
  }
}
