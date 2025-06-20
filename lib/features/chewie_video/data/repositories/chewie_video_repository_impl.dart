import 'package:myapp/features/chewie_video/domain/entities/chewie_video_entity.dart';

abstract class ChewieVideoRepository {
  Future<List<ChewieVideoEntity>> getChewieVideos();
}