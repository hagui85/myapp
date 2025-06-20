import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:myapp/features/chewie_video/presentation/cubit/chewie_video_cubit.dart';
import 'package:myapp/features/chewie_video/presentation/cubit/chewie_video_state.dart';

class ChewieVideoPage extends StatefulWidget {
  const ChewieVideoPage({Key? key}) : super(key: key);

  @override
  _ChewieVideoPageState createState() => _ChewieVideoPageState();
}

class _ChewieVideoPageState extends State<ChewieVideoPage> {
  late ChewieVideoCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = ChewieVideoCubit();
    _cubit.initializePlayer('YOUR_PLACEHOLDER_VIDEO_URL'); // Replace with your actual video URL
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chewie Video Player'),
      ),
      body: BlocProvider<ChewieVideoCubit>(
        create: (context) => _cubit,
        child: BlocBuilder<ChewieVideoCubit, ChewieVideoState>(
          builder: (context, state) {
            if (state is ChewieVideoLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ChewieVideoLoaded) {
              return Center(
                child: Chewie(
                  controller: state.chewieController,
                ),
              );
            } else if (state is ChewieVideoError) {
              return Center(
                child: Text('Error: ${state.message}'),
              );
            } else {
              return Container(); // Initial state or other unhandled states
            }
          },
        ),
      ),
    );
  }
}