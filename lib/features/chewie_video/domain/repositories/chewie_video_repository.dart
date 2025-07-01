import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failures.dart';
import '../entities/chewie_video_entity.dart';

abstract class ChewieVideoRepository {
  // Future<Either<Failure, ChewieVideoEntity>> getVideo(int id); // Keep if needed for other use cases
  Future<Either<Failure, List<ChewieVideoEntity>>> getChewieVideos();

  Future<Either<Failure, void>> clearCachedVideos();
}
