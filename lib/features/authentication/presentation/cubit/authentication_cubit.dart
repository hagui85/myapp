// lib/features/authentication/presentation/cubit/authentication_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:myapp/features/authentication/data/models/authentication_request.dart';
import 'package:myapp/features/authentication/data/models/login_params.dart';
import 'package:myapp/features/authentication/domain/use_cases/authentication_use_case.dart';
import 'package:myapp/features/authentication/presentation/cubit/authentication_state.dart'; // Assuming AuthenticationRequest is used here

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationUseCase authenticationUseCase;
  // Add other authentication use cases if needed
  // final FetchCachedTokenUseCase fetchCachedTokenUseCase;
  // final FetchCachedRequestUseCase fetchCachedRequestUseCase;

  AuthenticationCubit({
    required this.authenticationUseCase,
    // Add other authentication use cases here
    // required this.fetchCachedTokenUseCase,
    // required this.fetchCachedRequestUseCase,
  }) : super(AuthenticationInitial());

  /* Future<void> login(AuthenticationRequest authenticationRequest) async {
    emit(AuthenticationLoading());
    final result = await authenticationUseCase(authenticationRequest);
    result.fold(
      (failure) => emit(
        AuthenticationError(failure.message),
      ), // Assuming Failure has a message property
      (authenticationEntity) =>
          emit(AuthenticationAuthenticated()), // You might pass the entity here
    );
  }*/
  Future<void> login(LoginParams loginParams) async {
    emit(AuthenticationLoading());

    final result = await authenticationUseCase(loginParams);

    result.fold(
      (failure) => emit(AuthenticationError(failure.message)),
      (authenticationEntity) => emit(AuthenticationAuthenticated()),
    );
  }

  // You can add methods for fetching cached token and request here if needed
  // Future<void> checkCachedAuthentication() async {
  //   emit(AuthenticationLoading());
  //   final result = await fetchCachedTokenUseCase(NoParams()); // Assuming FetchCachedTokenUseCase takes NoParams
  //   result.fold(
  //     (failure) => emit(AuthenticationInitial()), // Or an error state if preferred
  //     (authenticationEntity) => emit(AuthenticationAuthenticated()), // Emit authenticated if token exists
  //   );
  // }

  // Future<void> getCachedAuthenticationRequest() async {
  //   final result = await fetchCachedRequestUseCase(NoParams()); // Assuming FetchCachedRequestUseCase takes NoParams
  //   result.fold(
  //     (failure) => print('Error fetching cached request: ${failure.message}'), // Handle error appropriately
  //     (authenticationRequest) => print('Cached request: ${authenticationRequest.toJson()}'), // Use the cached request
  //   );
  // }
}
