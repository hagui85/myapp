import 'package:dartz/dartz.dart';
import '../entities/video_entity.dart';
import '../../../../core/error/failures.dart';

abstract class VideoRepository {
  Future<Either<Failure, VideoEntity>> getVideo(int id);
}
