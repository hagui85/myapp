import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/core/error/failures.dart';
import 'package:myapp/features/chewie_video/domain/entities/chewie_video_entity.dart';
import 'package:myapp/features/chewie_video/domain/usecases/get_chewie_videos_use_case.dart';
import 'package:myapp/features/chewie_video/presentation/cubit/chewie_video_cubit.dart';
import 'package:myapp/features/chewie_video/presentation/cubit/chewie_video_state.dart';

import 'chewie_video_cubit_test.mocks.dart';

@GenerateMocks([GetChewieVideosUseCase])
void main() {
  late ChewieVideoCubit cubit;
  late MockGetChewieVideosUseCase mockGetChewieVideosUseCase;

  setUp(() {
    mockGetChewieVideosUseCase = MockGetChewieVideosUseCase();
    cubit = ChewieVideoCubit(mockGetChewieVideosUseCase);
  });

  tearDown(() {
    cubit.close();
  });

  test('initial state should be ChewieVideoInitial', () {
    expect(cubit.state, ChewieVideoInitial());
  });

  group('getVideos', () {
    final tChewieVideoEntityList = [
      const ChewieVideoEntity(id: 1, url: 'url1', description: 'desc1'),
      const ChewieVideoEntity(id: 2, url: 'url2', description: 'desc2'),
    ];

    test(
      'should emit [Loading, Loaded] when usecase call is successful',
      () async {
        // Arrange
        when(
          mockGetChewieVideosUseCase.execute(),
        ).thenAnswer((_) async => Right(tChewieVideoEntityList));

        // Assert later
        final expectedStates = [
          ChewieVideoLoading(),
          ChewieVideoLoaded(tChewieVideoEntityList),
        ];

        // Act and Assert
        await expectLater(cubit.stream, emitsInOrder(expectedStates));

        cubit.getVideos();
      },
    );

    test(
      'should emit [Loading, Error] when usecase call is unsuccessful',
      () async {
        // Arrange
        when(
          mockGetChewieVideosUseCase.execute(),
        ).thenAnswer((_) async => Left(Failure("fail")));

        // Assert later
        final expectedStates = [ChewieVideoLoading(), isA<ChewieVideoError>()];

        // Act and Assert
        await expectLater(cubit.stream, emitsInOrder(expectedStates));

        cubit.getVideos();
      },
    );
  });
}
