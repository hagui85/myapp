import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/core/api/dio_client.dart';
import 'package:myapp/features/authentication/data/datasources/authentication_local_data_source.dart';
import 'package:myapp/features/authentication/data/datasources/authentication_local_data_source_impl.dart';
import 'package:myapp/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:myapp/features/authentication/data/datasources/authentication_remote_data_source_impl.dart';
import 'package:myapp/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:myapp/features/authentication/domain/use_cases/authentication_use_case.dart';
import 'package:myapp/features/authentication/presentation/authentication_repository_impl.dart';
import 'package:myapp/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart'; // For SharedPreferences
// For Dioimport 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/utils/internet_checking_utilities.dart';
// For network connectivity

// Import other dependencies as needed (e.g., Failure, Exceptions, UseCase base class if not already imported)

final getIt = GetIt.instance;

Future<void> init() async {
  // ================== Core ==================

  // Network
  getIt.registerLazySingleton(() => DioClient(getIt()));

  // Utilities
  getIt.registerLazySingleton(() => InternetCheckingUtilities());

  // Local Storage
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

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
  getIt.registerLazySingleton<AuthenticationUseCase>(
    () => AuthenticationUseCase(getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
    ),
  );

  // Data Sources
  getIt.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(dio: getIt()),
  );

  getIt.registerLazySingleton<AuthenticationLocalDataSource>(
    () => AuthenticationLocalDataSourceImpl(sharedPreferences: getIt()),
  );
}
