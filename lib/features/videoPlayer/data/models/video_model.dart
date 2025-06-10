import 'package:myapp/features/videoPlayer/domain/entities/video_entity.dart';

class VideoModel extends VideoEntity {
  const VideoModel({required super.id, required super.url, super.description});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'] as int,
      url: json['url'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'url': url, 'description': description};
  }
}
