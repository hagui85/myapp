import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/chewie_video/domain/usecases/get_chewie_videos_use_case.dart';
import 'package:myapp/features/chewie_video/presentation/cubit/video_list_state.dart';

class VideoListCubit extends Cubit<VideoListState> {
  final GetChewieVideosUseCase getChewieVideosUseCase;

  VideoListCubit({required this.getChewieVideosUseCase})
    : super(VideoListInitial());

  Future<void> loadVideos() async {
    emit(VideoListLoading());
    final result = await getChewieVideosUseCase.execute();
    result.fold(
      (failure) => emit(VideoListError(failure.message)),
      (videos) => emit(VideoListLoaded(videos)),
    );
  }
}
