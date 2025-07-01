import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';

import 'chewie_video_state.dart';
import '../../domain/usecases/chewie_video_use_case.dart';

class ChewieVideoCubit extends Cubit<ChewieVideoState> {
  ChewieController? _chewieController;
  final PlayVideoUseCase playVideoUseCase;

  ChewieVideoCubit({required this.playVideoUseCase})
    : super(const ChewieVideoInitial());

  Future<void> initializePlayer(
    String videoPath,
    VideoSourceType sourceType,
  ) async {
    emit(const ChewieVideoLoading());
    try {
      _chewieController = await playVideoUseCase.execute(videoPath, sourceType);
      emit(ChewieVideoLoaded(_chewieController!));
    } catch (e) {
      emit(ChewieVideoError('Failed to load video: ${e.toString()}'));
    }
  }

  @override
  Future<void> close() {
    _chewieController?.videoPlayerController.dispose();
    _chewieController?.dispose();
    return super.close();
  }
}
