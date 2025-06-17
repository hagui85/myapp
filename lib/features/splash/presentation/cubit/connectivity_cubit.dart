import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/usecases/usecases.dart';
import 'package:myapp/features/splash/domain/use_cases/check_internet_connection_use_case.dart';

enum ConnectivityStatus { connected, disconnected }

class ConnectivityCubit extends Cubit<ConnectivityStatus> {
  final CheckInternetConnectionUseCase checkInternetConnection;

  ConnectivityCubit(this.checkInternetConnection)
    : super(ConnectivityStatus.disconnected);

  void checkConnection() async {
    final isConnected = await checkInternetConnection.call(NoParams());

    isConnected.fold(
      (failure) => emit(ConnectivityStatus.disconnected),
      (bool) => emit(ConnectivityStatus.connected),
    );
  }
}
