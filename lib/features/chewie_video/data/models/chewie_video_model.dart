import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/chewie_video_entity.dart';

part 'chewie_video_model.g.dart'; // This line is crucial

@JsonSerializable()
class ChewieVideoModel extends ChewieVideoEntity {
  const ChewieVideoModel({
    required super.id,
    required super.url,
    super.description,
  });

  factory ChewieVideoModel.fromJson(Map<String, dynamic> json) {
    return ChewieVideoModel(
      id: json['id'] as int,
      url: json['url'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'url': url, 'description': description};
  }
}
