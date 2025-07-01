import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/core/utils/video_utils.dart';
import 'package:myapp/features/chewie_video/domain/usecases/chewie_video_use_case.dart';
import 'package:myapp/features/chewie_video/presentation/cubit/chewie_video_cubit.dart';
import 'package:myapp/features/chewie_video/presentation/cubit/chewie_video_state.dart';
import 'package:myapp/features/chewie_video/presentation/cubit/video_list_cubit.dart';
import 'package:myapp/features/chewie_video/presentation/cubit/video_list_state.dart';

class ChewieVideoPage extends StatefulWidget {
  static const CHEWIE = 'CHEWIE_VIDEO';

  const ChewieVideoPage({super.key});

  @override
  _ChewieVideoPageState createState() => _ChewieVideoPageState();
}

class _ChewieVideoPageState extends State<ChewieVideoPage> {
  late ChewieVideoCubit _chewieCubit;
  final VideoListCubit _videoListCubit = GetIt.I<VideoListCubit>();

  String? selectedVideoUrl;
  final String userName =
      "Toto"; // Tu peux le récupérer dynamiquement plus tard si nécessaire

  @override
  void initState() {
    super.initState();
    _chewieCubit = ChewieVideoCubit(
      playVideoUseCase: GetIt.I<PlayVideoUseCase>(),
    );
    _videoListCubit.loadVideos();
  }

  @override
  void dispose() {
    _chewieCubit.close();
    _videoListCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String firstLetter = userName.isNotEmpty
        ? userName[0].toUpperCase()
        : '?';

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _videoListCubit),
        BlocProvider.value(value: _chewieCubit),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/spalsh_icon.png',
              width: 35,
              height: 35,
            ),
          ),
          title: const Text(
            'Chrono Formation',
          ), //todo(ZHA) rendre dynamique appName
          actions: [
            Tooltip(
              message: 'Connecté en tant que "$userName"',
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    firstLetter,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: BlocBuilder<VideoListCubit, VideoListState>(
                builder: (context, state) {
                  if (state is VideoListLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is VideoListLoaded) {
                    return ListView.separated(
                      itemCount: state.videos.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final video = state.videos[index];
                        final isSelected = video.url == selectedVideoUrl;

                        return ListTile(
                          tileColor: isSelected
                              ? Colors.blue.withOpacity(0.1)
                              : Colors.transparent,
                          leading: FutureBuilder<String?>(
                            future: VideoUtils.getThumbnailFile(
                              videoUrl: video.url,
                            ),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const SizedBox(
                                  width: 64,
                                  height: 36,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 1.5,
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasData &&
                                  snapshot.data != null) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.file(
                                    File(snapshot.data!),
                                    width: 64,
                                    height: 36,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              } else {
                                return const Icon(Icons.video_library);
                              }
                            },
                          ),
                          title: Text(video.id.toString()),
                          subtitle: Text(video.description ?? ''),
                          onTap: () {
                            setState(() => selectedVideoUrl = video.url);
                            _chewieCubit.initializePlayer(
                              video.url,
                              VideoSourceType.network,
                            );
                          },
                        );
                      },
                    );
                  } else if (state is VideoListError) {
                    return Center(child: Text('Erreur: ${state.message}'));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: BlocBuilder<ChewieVideoCubit, ChewieVideoState>(
                builder: (context, state) {
                  if (state is ChewieVideoLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ChewieVideoLoaded) {
                    return Chewie(controller: state.chewieController);
                  } else if (state is ChewieVideoError) {
                    return Center(child: Text('Erreur: ${state.message}'));
                  } else {
                    return const Center(child: Text("Sélectionnez une vidéo"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
