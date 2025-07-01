import 'package:myapp/core/usecases/usecases.dart';
import 'package:myapp/features/authentication/data/models/authentication_request.dart';

import '../repositories/chewie_video_repository.dart';
import '../entities/chewie_video_entity.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

class GetChewieVideosUseCase
    implements UseCase<List<ChewieVideoEntity>, AuthenticationRequest> {
  final ChewieVideoRepository repository;

  GetChewieVideosUseCase(this.repository);

  Future<Either<Failure, List<ChewieVideoEntity>>> execute() async {
    return await repository.getChewieVideos();
  }

  @override
  Future<Either<Failure, List<ChewieVideoEntity>>> call(
    AuthenticationRequest params,
  ) async {
    return await repository.getChewieVideos();
  }
}
