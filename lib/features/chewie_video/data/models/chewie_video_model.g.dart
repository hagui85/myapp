// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chewie_video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChewieVideoModel _$ChewieVideoModelFromJson(Map<String, dynamic> json) =>
    ChewieVideoModel(
      id: (json['id'] as num).toInt(),
      url: json['url'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ChewieVideoModelToJson(ChewieVideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'description': instance.description,
    };
