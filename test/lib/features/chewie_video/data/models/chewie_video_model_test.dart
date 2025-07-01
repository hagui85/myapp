import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/features/chewie_video/data/models/chewie_video_model.dart';

void main() {
  const tChewieVideoModel = ChewieVideoModel(
    id: 1,
    url: 'http://example.com/video.mp4',
    description: 'Test video description',
  );

  const tChewieVideoModelWithoutDescription = ChewieVideoModel(
    id: 2,
    url: 'http://example.com/another_video.mp4',
  );

  final tChewieVideoModelJson = {
    'id': 1,
    'url': 'http://example.com/video.mp4',
    'description': 'Test video description',
  };

  final tChewieVideoModelWithoutDescriptionJson = {
    'id': 2,
    'url': 'http://example.com/another_video.mp4',
    'description': null, // json_serializable includes nulls by default
  };


  group('ChewieVideoModel fromJson', () {
    test(
      'should return a valid model when the JSON includes a description',
      () async {
        // Arrange
        final Map<String, dynamic> jsonMap = tChewieVideoModelJson;
        // Act
        final result = ChewieVideoModel.fromJson(jsonMap);
        // Assert
        expect(result, tChewieVideoModel);
      },
    );

    test(
      'should return a valid model when the JSON does NOT include a description',
      () async {
        // Arrange
        final Map<String, dynamic> jsonMap = tChewieVideoModelWithoutDescriptionJson;
        // Act
        final result = ChewieVideoModel.fromJson(jsonMap);
        // Assert
        expect(result, tChewieVideoModelWithoutDescription);
      },
    );
  });

  group('ChewieVideoModel toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // Act
        final result = tChewieVideoModel.toJson();
        // Assert
        final expectedMap = tChewieVideoModelJson;
        expect(result, expectedMap);
      },
    );

     test(
      'should return a JSON map containing the proper data when description is null',
      () async {
        // Act
        final result = tChewieVideoModelWithoutDescription.toJson();
        // Assert
        final expectedMap = tChewieVideoModelWithoutDescriptionJson;
        expect(result, expectedMap);
      },
    );
  });
}