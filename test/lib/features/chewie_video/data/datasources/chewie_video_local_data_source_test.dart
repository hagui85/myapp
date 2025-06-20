import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/features/chewie_video/data/datasources/chewie_video_local_data_source.dart';
import 'package:myapp/features/chewie_video/data/models/chewie_video_model.dart';

class MockChewieVideoLocalDataSource extends Mock
    implements ChewieVideoLocalDataSource {
  //@override
  //Future<List<ChewieVideoModel>> getChewieVideos() =>
  //  mockito.noSuchMethod(Invocation.method(#getChewieVideos, []), returnValue: Future.value(<ChewieVideoModel>[])) as Future<List<ChewieVideoModel>>;
}

@GenerateMocks([ChewieVideoLocalDataSource])
void main() {

  setUp(() {
  });

  test(
    'should return a list of ChewieVideoModel from assets/videos.json',
    () async {
      // Mock the rootBundle.loadString to return fake JSON data
      const fakeJson = '''
[
  {
    "id": 1,
    "url": "https://example.com/video1.mp4",
    "description": "Description for video 1"
  },
  {
    "id": 2,
    "url": "https://example.com/video2.mp4",
    "description": "Description for video 2"
  }
]
    ''';

      // Provide a mock implementation for rootBundle.loadString
      TestWidgetsFlutterBinding.ensureInitialized(); // Required for rootBundle
      when(
        rootBundle.loadString('assets/videos.json'),
      ).thenAnswer((_) async => fakeJson);

      // Create an instance of the actual data source (not the mock)
      final dataSource = ChewieVideoLocalDataSourceImpl();

      // Call the method to be tested
      final videoList = await dataSource.getChewieVideos();

      // Assertions
      expect(videoList, isA<List<ChewieVideoModel>>());
      expect(videoList.length, 2);
      expect(videoList[0].id, 1);
      expect(videoList[0].url, 'https://example.com/video1.mp4');
      expect(videoList[0].description, 'Description for video 1');
      expect(videoList[1].id, 2);
      expect(videoList[1].url, 'https://example.com/video2.mp4');
      expect(videoList[1].description, 'Description for video 2');
    },
  );

  test('should throw an exception if file reading fails', () async {
    // Mock the rootBundle.loadString to throw an exception
    TestWidgetsFlutterBinding.ensureInitialized(); // Required for rootBundle
    when(
      rootBundle.loadString('assets/videos.json'),
    ).thenThrow(Exception('Failed to read file'));

    final dataSource = ChewieVideoLocalDataSourceImpl();

    // Expect the method to throw an exception
    expect(() => dataSource.getChewieVideos(), throwsA(isA<Exception>()));
  });

  test('should return an empty list if JSON is empty', () async {
    // Mock the rootBundle.loadString to return empty JSON array
    const fakeJson = '[]';

    TestWidgetsFlutterBinding.ensureInitialized();
    when(
      rootBundle.loadString('assets/videos.json'),
    ).thenAnswer((_) async => fakeJson);

    final dataSource = ChewieVideoLocalDataSourceImpl();

    final videoList = await dataSource.getChewieVideos();

    expect(videoList, isA<List<ChewieVideoModel>>());
    expect(videoList.length, 0);
  });

  test('should handle missing description field', () async {
    // Mock the rootBundle.loadString with JSON missing description
    const fakeJson = '''
[
  {
    "id": 1,
    "url": "https://example.com/video1.mp4"
  }
]
    ''';

    TestWidgetsFlutterBinding.ensureInitialized();
    when(
      rootBundle.loadString('assets/videos.json'),
    ).thenAnswer((_) async => fakeJson);

    final dataSource = ChewieVideoLocalDataSourceImpl();

    final videoList = await dataSource.getChewieVideos();

    expect(videoList.length, 1);
    expect(videoList[0].id, 1);
    expect(videoList[0].url, 'https://example.com/video1.mp4');
    expect(videoList[0].description, isNull);
  });
}
