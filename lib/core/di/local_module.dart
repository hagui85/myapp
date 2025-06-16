
class LocalModule {
  /*static Future<void> init(GetIt sl) async {
    // DataSources
    sl.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImpl(sharedPreferences: sl.get()),
    );
    sl.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(dioClient: NetworkModule.),
    );

    // Local Storage
  // Register SharedPreferences instance
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

    // Repositories
    sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(
        authenticationRemoteDataSource: sl(),
        authenticationLocalDataSource: sl(),
      ),
    );
    sl.registerLazySingleton<VideoRepository>(() => VideoRepositoryImpl(sl()));

    // Use Cases
    sl.registerLazySingleton<AuthenticationUseCase>(
      () => AuthenticationUseCase(sl()),
    );
    sl.registerLazySingleton<GetVideoUseCase>(() => GetVideoUseCase(sl()));
  }*/
}
