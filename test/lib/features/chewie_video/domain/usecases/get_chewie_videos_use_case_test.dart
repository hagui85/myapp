import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/core/error/failures.dart';
import 'package:myapp/features/chewie_video/domain/entities/chewie_video_entity.dart';
import 'package:myapp/features/chewie_video/domain/repositories/chewie_video_repository.dart';
import 'package:myapp/features/chewie_video/domain/usecases/get_chewie_videos_use_case.dart';

import 'get_chewie_videos_use_case_test.mocks.dart'; // Generated file

@GenerateMocks([ChewieVideoRepository])
void main() {
  late GetChewieVideosUseCase usecase;
  late MockChewieVideoRepository mockChewieVideoRepository;

  setUp(() {
    mockChewieVideoRepository = MockChewieVideoRepository();
    usecase = GetChewieVideosUseCase(mockChewieVideoRepository);
  });

  final tChewieVideoEntityList = [
    const ChewieVideoEntity(id: 1, url: 'url1', description: 'desc1'),
    const ChewieVideoEntity(id: 2, url: 'url2', description: 'desc2'),
  ];

  test('should get list of chewie videos from the repository', () async {
    // Arrange
    when(
      mockChewieVideoRepository.getChewieVideos(),
    ).thenAnswer((_) async => Right(tChewieVideoEntityList));

    // Act
    final result = await usecase.execute();

    // Assert
    expect(result, Right(tChewieVideoEntityList));
    verify(mockChewieVideoRepository.getChewieVideos());
    verifyNoMoreInteractions(mockChewieVideoRepository);
  });

  test(
    'should return Failure when the call to repository is unsuccessful',
    () async {
      // Arrange
      when(
        mockChewieVideoRepository.getChewieVideos(),
      ).thenAnswer((_) async => const Left(Failure('Server Error')));

      // Act
      final result = await usecase.execute();

      // Assert
      expect(result, const Left(Failure('Server Error')));
      verify(mockChewieVideoRepository.getChewieVideos());
      verifyNoMoreInteractions(mockChewieVideoRepository);
    },
  );
}
