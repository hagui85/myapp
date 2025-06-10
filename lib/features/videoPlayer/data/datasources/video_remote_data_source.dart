import '../models/video_model.dart';

abstract class VideoRemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<VideoModel> getVideo(int id);
}
