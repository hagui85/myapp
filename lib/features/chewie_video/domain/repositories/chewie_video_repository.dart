import '../entities/chewie_video_entity.dart';

abstract class ChewieVideoRepository {
  // Future<Either<Failure, ChewieVideoEntity>> getVideo(int id); // Keep if needed for other use cases
  Future<List<ChewieVideoEntity>> getChewieVideos();
}