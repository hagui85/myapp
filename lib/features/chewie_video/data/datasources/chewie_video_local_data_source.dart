import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:myapp/features/chewie_video/data/models/chewie_video_model.dart';

abstract class ChewieVideoLocalDataSource {
  Future<List<ChewieVideoModel>> getChewieVideos();
}

class ChewieVideoLocalDataSourceImpl implements ChewieVideoLocalDataSource {
  @override
  Future<List<ChewieVideoModel>> getChewieVideos() async {
    try {
      final String response = await rootBundle.loadString('assets/videos.json');
      final List<dynamic> data = jsonDecode(response);
      return data
          .map<ChewieVideoModel>(
            (json) => ChewieVideoModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to load videos: $e');
    }
  }
}
