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

final getIt = GetIt.instance; // Or final sl = GetIt.instance;

Future<void> init() async {

  // ==================! Features !====================

  // Authentication
  getIt.registerFactory(
    () => AuthenticationCubit(
      authenticationUseCase: getIt(),
      // Register other authentication use cases if needed
      // fetchCachedTokenUseCase: getIt(),
      // fetchCachedRequestUseCase: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => AuthenticationUseCase(getIt()));
  // Register other authentication use cases if needed
  // getIt.registerLazySingleton(() => FetchCachedTokenUseCase(getIt()));
  // getIt.registerLazySingleton(() => FetchCachedRequestUseCase(getIt()));

  // Repository
  getIt.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt<AuthenticationLocalDataSourceImpl>(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<AuthenticationRemoteDataSource>(
    () => AuthenticationRemoteDataSourceImpl(
      dio: getIt(),
    ), // Pass the registered Dio instance
  );

  getIt.registerLazySingleton<AuthenticationLocalDataSource>(
    // Pass your local storage instance here (e.g., SharedPreferences instance, Hive box)
    () => AuthenticationLocalDataSourceImpl(sharedPreferences: getIt()),
  );

  // ==================! Core !====================

  // Network
  //getIt.registerLazySingleton(() => Dio()); // Register Dio if you use it directly
  getIt.registerLazySingleton(
    () => DioClient(getIt()),
  ); // Pass the registered Dio instance

  getIt.registerLazySingleton(() => InternetCheckingUtilities());
  // You might also want to register a NetworkInfo interface and its implementation
  // getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  // Local Storage
  // Register SharedPreferences instance
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

  // If you use Hive, register your Hive box(es)
  // await Hive.initFlutter();
  // final authBox = await Hive.openBox('authBox');
  // getIt.registerLazySingleton(() => authBox);

  // External
  // You might register other external dependencies here (e.g., http client if you use it)
  getIt.registerLazySingleton(() => http.Client());
}
