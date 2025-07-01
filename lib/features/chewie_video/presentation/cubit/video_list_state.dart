import 'package:equatable/equatable.dart';
import '../../domain/entities/chewie_video_entity.dart';

abstract class VideoListState extends Equatable {
  const VideoListState();

  @override
  List<Object?> get props => [];
}

class VideoListInitial extends VideoListState {}

class VideoListLoading extends VideoListState {}

class VideoListLoaded extends VideoListState {
  final List<ChewieVideoEntity> videos;

  const VideoListLoaded(this.videos);

  @override
  List<Object?> get props => [videos];
}

class VideoListError extends VideoListState {
  final String message;

  const VideoListError(this.message);

  @override
  List<Object?> get props => [message];
}
