import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failures.dart';
import 'package:myapp/features/videoPlayer/domain/entities/video_entity.dart';
import 'package:myapp/features/videoPlayer/domain/repositories/video_repository.dart';

class GetVideo {
  final VideoRepository repository;

  GetVideo(this.repository);

  Future<Either<Failure, VideoEntity>> call(int id) async {
    return await repository.getVideo(id);
  }
}
