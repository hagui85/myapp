import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import 'chewie_video_state.dart';

class ChewieVideoCubit extends Cubit<ChewieVideoState> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  ChewieVideoCubit() : super(ChewieVideoInitial());

  Future<void> initializePlayer(String videoUrl) async {
    emit(ChewieVideoLoading());
    try {
      _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(videoUrl),
      );
      await _videoPlayerController!.initialize();
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        autoPlay: true,
        looping: true,
      );
      emit(ChewieVideoLoaded(_chewieController!));
    } catch (e) {
      emit(ChewieVideoError('Failed to load video: ${e.toString()}'));
    }
  }

  @override
  Future<void> close() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    return super.close();
  }
}
// This is a dummy file to help create the directory structure.
// You can remove this file once the structure is in place.