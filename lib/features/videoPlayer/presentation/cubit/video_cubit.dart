import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/models/video.dart';

// Define the states for the VideoCubit
abstract class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoSuccess extends VideoState {
  final List<Video> videos;

  const VideoSuccess(this.videos);

  @override
  List<Object> get props => [videos];
}

class VideoError extends VideoState {
  final String message;

  const VideoError(this.message);

  @override
  List<Object> get props => [message];
}

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitial());

  Future<void> fetchVideos() async {
    emit(VideoLoading());
    const String url = "https://xproto-chr.eu:50843/formation/getVideos";
    const Map<String, dynamic> data = {
      "login": "019222",
      "idDeal": "T9252",
      "Functions": ["ADM", "DTP"],
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> rawVideos = responseData['result'];

        // The API response format is unusual, we need to parse it carefully
        List<Video> videos = [];
        for (int i = 0; i < rawVideos.length; i += 6) {
          if (i + 5 < rawVideos.length) {
            videos.add(
              Video(
                url: rawVideos[i + 1] as String,
                description: rawVideos[i + 3] as String,
                id: rawVideos[i + 5] as int,
              ),
            );
          }
        }

        emit(VideoSuccess(videos));
      } else {
        emit(VideoError("Failed to load videos: ${response.statusCode}"));
      }
    } catch (e) {
      emit(VideoError("An error occurred: ${e.toString()}"));
    }
  }
}
