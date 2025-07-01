import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/core/api/dio_client.dart';
import 'package:myapp/core/preferences/preferences_repository.dart';
import 'package:myapp/core/preferences/preferences_repository_impl.dart';
import 'package:myapp/core/utils/shared_prefs_helper.dart';
import 'package:myapp/features/authentication/data/datasources/authentication_local_data_source.dart';
import 'package:myapp/features/authentication/data/datasources/authentication_local_data_source_impl.dart';
import 'package:myapp/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:myapp/features/authentication/data/datasources/authentication_remote_data_source_impl.dart';
import 'package:myapp/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:myapp/features/authentication/domain/use_cases/authentication_use_case.dart';
import 'package:myapp/features/authentication/presentation/authentication_repository_impl.dart';
import 'package:myapp/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:myapp/features/chewie_video/data/datasources/chewie_video_local_data_source.dart';
import 'package:myapp/features/chewie_video/data/datasources/chewie_video_local_data_source_impl.dart';
import 'package:myapp/features/chewie_video/data/datasources/chewie_video_remote_data_source.dart';
import 'package:myapp/features/chewie_video/data/repositories/chewie_video_repository_impl.dart';
import 'package:myapp/features/chewie_video/domain/repositories/chewie_video_repository.dart';
import 'package:myapp/features/chewie_video/domain/usecases/chewie_video_use_case.dart';
import 'package:myapp/features/chewie_video/domain/usecases/get_chewie_videos_use_case.dart';
import 'package:myapp/features/chewie_video/presentation/cubit/chewie_video_cubit.dart';
import 'package:myapp/features/chewie_video/presentation/cubit/video_list_cubit.dart';
import 'package:myapp/features/splash/data/repositories/splash_repositories_imp.dart';
import 'package:myapp/features/splash/domain/repositories/splash_repositories.dart';
import 'package:myapp/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart'; // For SharedPreferences
// For Dioimport 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/utils/internet_checking_utilities.dart';

import '../../features/splash/data/repositories/connectivity_repository_impl.dart';
import '../../features/splash/domain/repositories/connectivity_repository.dart';
import '../../features/splash/domain/use_cases/check_internet_connection_use_case.dart';
import '../../features/splash/presentation/cubit/connectivity_cubit.dart';
import 'network_module.dart';
// For network connectivity

// Import other dependencies as needed (e.g., Failure, Exceptions, UseCase base class if not already imported)

final getIt = GetIt.instance;

Future<void> init() async {
  // --- External Dependencies ---
  final sharedPrefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPrefs);

  // ================== Core ==================
  getIt.registerLazySingleton(
    () => SharedPrefsHelper(getIt()),
  ); // Register SharedPrefsHelper
  getIt.registerLazySingleton<PreferencesRepository>(
    // Register PreferencesRepository
    () => PreferencesRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton(() => NetworkModule.provideDio());
  // Network
  getIt.registerLazySingleton(() => DioClient(getIt()));

  // Utilities
  getIt.registerLazySingleton(() => InternetCheckingUtilities());

  // Local Storage
  // final sharedPreferences = await SharedPreferences.getInstance();
  //getIt.registerLazySingleton(() => sharedPreferences);

  // External libraries
  getIt.registerLazySingleton(() => http.Client());

  // Initialize feature-specific dependencies
  initFeatures();
}

void initFeatures() {
  // ================== Features ==================

  // === Authentication ===

  // Cubits
  getIt.registerFactory<AuthenticationCubit>(
    () => AuthenticationCubit(authenticationUseCase: getIt()),
  );

  // Use Cases
  //getIt.registerLazySingleton<AuthenticationUseCase>(
   // () => AuthenticationUseCase(getIt()),
  //);

  getIt.registerLazySingleton(() => AuthenticationUseCase(
repository: getIt<AuthenticationRepository>(),
  preferencesRepository: getIt<PreferencesRepository>(),
));


  // Repositories
  getIt.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      authenticationRemoteDataSource: getIt(),
      localDataSource: getIt(),
    ),
  );

  // Data Sources
  getIt.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(dio: getIt()),
  );

  getIt.registerLazySingleton<AuthenticationLocalDataSource>(
    () => AuthenticationLocalDataSourceImpl(
      sharedPreferences: getIt(),
      preferencesRepository: getIt(),
    ),
  );

  // === Chewie Video ===
  // Data Sources
  getIt.registerLazySingleton<ChewieVideoLocalDataSource>(
    () => ChewieVideoLocalDataSourceImpl(),
  );

  getIt.registerLazySingleton<ChewieVideoRemoteDataSource>(
    () => ChewieVideoRemoteDataSourceImpl(dio: getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<ChewieVideoRepository>(
    () => ChewieVideoRepositoryImpl(
      localDataSource: getIt(),
      remoteDataSource: getIt(),
      preferencesRepository: getIt(),
    ),
  );

  // Use Cases
  getIt.registerLazySingleton<GetChewieVideosUseCase>(
    () => GetChewieVideosUseCase(getIt()),
  );
  getIt.registerLazySingleton(() => PlayVideoUseCase());

  getIt.registerFactory<VideoListCubit>(
    () => VideoListCubit(getChewieVideosUseCase: getIt()),
  );

  getIt.registerFactory<ChewieVideoCubit>(
    () => ChewieVideoCubit(playVideoUseCase: getIt()),
  );

  ///=========== Splash Module start ===========
  /// Registering ConnectivityRepositoryImpl as a singleton
  ///
  getIt.registerLazySingleton(() => Connectivity());
  getIt.registerLazySingleton<ConnectivityRepository>(
    () => ConnectivityRepositoryImpl(getIt<Connectivity>()),
  );

  getIt.registerFactory(
    () => CheckInternetConnectionUseCase(getIt<ConnectivityRepository>()),
  );
  getIt.registerFactory<ConnectivityCubit>(
    () => ConnectivityCubit(getIt<CheckInternetConnectionUseCase>()),
  );

  ///=========== Splash Module end ===========
  // Splash Repository Implementation à implémenter si pas encore fait
getIt.registerLazySingleton<SplashRepositories>(
  () => SplashRepositoriesImpl(preferencesRepository: getIt()),
);

// Splash Cubit
getIt.registerFactory<SplashCubit>(
  () => SplashCubit(getIt<SplashRepositories>()),
);

}
