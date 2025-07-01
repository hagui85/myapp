import 'package:myapp/core/api/dio_client.dart';
import 'package:myapp/features/chewie_video/data/models/chewie_video_model.dart';

abstract class ChewieVideoRemoteDataSource {
  Future<List<ChewieVideoModel>> getChewieVideos();
}

class ChewieVideoRemoteDataSourceImpl implements ChewieVideoRemoteDataSource {
  final DioClient dio;

  ChewieVideoRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ChewieVideoModel>> getChewieVideos() {
    // TODO: Implement remote data fetching
    throw UnimplementedError();
  }
}
// This is a dummy file to help create the directory structure.
// You can remove this file after the directories are created.