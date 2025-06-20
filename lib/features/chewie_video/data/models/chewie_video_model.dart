import '../../domain/entities/chewie_video_entity.dart';

class ChewieVideoModel extends ChewieVideoEntity {
  const ChewieVideoModel({
    required int id,
    required String url,
    String? description,
  }) : super(id: id, url: url, description: description);

  factory ChewieVideoModel.fromJson(Map<String, dynamic> json) {
    return ChewieVideoModel(
      id: json['id'] as int,
      url: json['url'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'description': description,
    };
  }
}
