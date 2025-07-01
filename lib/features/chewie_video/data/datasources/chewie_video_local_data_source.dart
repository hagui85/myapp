import 'package:myapp/features/chewie_video/data/models/chewie_video_model.dart';

abstract class ChewieVideoLocalDataSource {
  Future<List<ChewieVideoModel>> getChewieVideos();
}
