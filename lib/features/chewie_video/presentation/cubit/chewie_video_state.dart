import 'package:chewie/chewie.dart';
import 'package:equatable/equatable.dart';

abstract class ChewieVideoState extends Equatable {
  const ChewieVideoState();

  @override
  List<Object?> get props => [];
}

class ChewieVideoInitial extends ChewieVideoState {
  const ChewieVideoInitial();
}

class ChewieVideoLoading extends ChewieVideoState {
  const ChewieVideoLoading();
}

class ChewieVideoLoaded extends ChewieVideoState {
  const ChewieVideoLoaded(this.chewieController);

  final ChewieController chewieController;

  @override
  List<Object?> get props => [chewieController];
}

class ChewieVideoError extends ChewieVideoState {
  const ChewieVideoError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}