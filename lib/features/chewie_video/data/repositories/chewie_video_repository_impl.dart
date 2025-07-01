import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failures.dart';
import 'package:myapp/core/preferences/preferences_repository.dart';
import 'package:myapp/features/chewie_video/data/datasources/chewie_video_local_data_source.dart';
import 'package:myapp/features/chewie_video/data/datasources/chewie_video_remote_data_source.dart';
import 'package:myapp/features/chewie_video/data/models/chewie_video_model.dart';
import 'package:myapp/features/chewie_video/domain/entities/chewie_video_entity.dart';
import 'package:myapp/features/chewie_video/domain/repositories/chewie_video_repository.dart';

class ChewieVideoRepositoryImpl implements ChewieVideoRepository {
  final ChewieVideoLocalDataSource localDataSource;
  final ChewieVideoRemoteDataSource remoteDataSource;
  final PreferencesRepository preferencesRepository;

  static const cachedKey = 'chewie_video_cache';

  ChewieVideoRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.preferencesRepository,
  });

  @override
  Future<Either<Failure, List<ChewieVideoEntity>>> getChewieVideos() async {
    try {
      // Vérifier s'il y a une liste dans les préférences
      final cachedJson = preferencesRepository.getCachedVideoList();
      if (cachedJson != null && false) {
        final List<dynamic> data = jsonDecode(cachedJson);
        final videos = data
            .map<ChewieVideoModel>(
              (json) => ChewieVideoModel.fromJson(json as Map<String, dynamic>),
            )
            .toList();
        return Right(videos);
      }

      // Sinon, charger depuis les assets (mocked remote)
      final videos = await localDataSource.getChewieVideos();

      // Sauvegarder dans les SharedPreferences
      final jsonList = videos.map((video) => video.toJson()).toList();
      final jsonString = jsonEncode(jsonList);
      await preferencesRepository.saveVideoList(jsonString);

      return Right(videos);
    } catch (e) {
      return Left(Failure("Failed to get videos: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, void>> clearCachedVideos() async {
    try {
      await preferencesRepository.clearVideoList();
      return const Right(null);
    } catch (e) {
      return Left(Failure("Failed to clear cached videos: ${e.toString()}"));
    }
  }
}
