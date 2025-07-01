import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/core/resources/videos_list.dart';
import 'package:myapp/features/chewie_video/data/datasources/chewie_video_local_data_source.dart';
import 'package:myapp/features/chewie_video/data/models/chewie_video_model.dart';

class ChewieVideoLocalDataSourceImpl implements ChewieVideoLocalDataSource {
  @override
 Future<List<ChewieVideoModel>> getChewieVideos() async {
  try {
    final String response = VideosList.mockJsonString(); // Pas besoin de await
    final Map<String, dynamic> decoded = jsonDecode(response);
    final List<dynamic> videosJson = decoded['videos'];

    final List<ChewieVideoModel> data = videosJson
        .map<ChewieVideoModel>(
          (json) => ChewieVideoModel.fromJson(json as Map<String, dynamic>),
        )
        .toList();

    debugPrint("list from assets: $data");
    return data;
  } catch (e) {
    throw Exception('Failed to load videos: $e');
  }
}
}
