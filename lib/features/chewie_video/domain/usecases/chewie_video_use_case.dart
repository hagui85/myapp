import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

// Define the VideoSourceType enum (you can place this in a shared file if needed)
enum VideoSourceType { network, asset, file }

class VideoPlaybackException implements Exception {
  final String message;

  VideoPlaybackException(this.message);

  @override
  String toString() => 'VideoPlaybackException: $message';
}

class PlayVideoUseCase {
  Future<ChewieController> execute(
    String videoPath,
    VideoSourceType sourceType,
  ) async {
    VideoPlayerController videoPlayerController;

    try {
      switch (sourceType) {
        case VideoSourceType.network:
          videoPlayerController = VideoPlayerController.networkUrl(
            Uri.parse(videoPath),
          );
          break;
        case VideoSourceType.asset:
          videoPlayerController = VideoPlayerController.asset(videoPath);
          break;
        case VideoSourceType.file:
          videoPlayerController = VideoPlayerController.file(File(videoPath));
          break;
      }

      await videoPlayerController.initialize();

      final chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true, // Or false, depending on your preference
        looping: false, // Or true
        // Add other ChewieController options as needed
      );

      return chewieController;
    } catch (e) {
      throw VideoPlaybackException(
        'Failed to initialize video player: ${e.toString()}',
      );
    }
  }
}
