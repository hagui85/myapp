import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/videoPlayer/presentation/cubit/video_cubit.dart';
import 'package:myapp/models/video.dart';

class VideoSection extends StatefulWidget {
  const VideoSection({super.key});

  @override
  State<VideoSection> createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  static const List<Video> _mockVideos = [
    Video(
      id: 1,
      url: 'http://mockurl.com/video1.mp4',
      description: 'Mock Video 1',
    ),
    Video(
      id: 2,
      url: 'http://mockurl.com/video2.mp4',
      description: 'Mock Video 2',
    ),
    Video(
      id: 3,
      url: 'http://mockurl.com/video3.mp4',
      description: 'Mock Video 3',
    ),
  ];

  @override
  void initState() {
    super.initState();
    print('_mockVideos: $_mockVideos');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoCubit(),
      child: BlocBuilder<VideoCubit, VideoState>(
        builder: (context, state) {
          if (state is VideoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is VideoError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.message}'),
                  ElevatedButton(
                    onPressed: () {
                      context.read<VideoCubit>().fetchVideos();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else if (state is VideoSuccess) {
            final videos = state.videos;
            return Column(
              // Using mock data instead of state.videos for testing
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<VideoCubit>().fetchVideos();
                  },
                  child: const Text('Refresh Videos'),
                ),
                Expanded(
                  child: ListView.builder(
                    // Using mock data instead of state.videos for testing
                    itemCount: videos.length,
                    itemBuilder: (context, index) {
                      final Video video = videos[index];
                      return ListTile(
                        title: Text(video.description ?? ''),
                        subtitle: Text(video.url),
                        // You can add an onTap to play the video
                        onTap: () {
                          // TODO: Implement video playback
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return const Center(child: Text('Press the button to load videos'));
        },
      ),
    );
  }
}
