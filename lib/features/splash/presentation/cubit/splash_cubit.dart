import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/splash/domain/repositories/splash_repositories.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SplashRepositories splashRepositories;

  SplashCubit(this.splashRepositories) : super(SplashStateInitial());

  Future<void> initialize() async {
    emit(SplashStateLoading());

    try {
      await splashRepositories.initializeDeviceInfo();
      emit(SplashStateSuccess());
    } catch (e) {
      emit(SplashStateFailure(error: e.toString()));
    }
  }
}
