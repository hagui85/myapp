import 'package:dio/dio.dart';

abstract class NetworkModule {

  static Dio provideDio() {
    return Dio()

    /// Set the connection timeout
      //..options.connectTimeout = const Duration(milliseconds: )

    /// Set the receive timeout
     // ..options.receiveTimeout = const Duration(milliseconds: AppStrings.receiveTimeout)

    /// Set the headers
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'};
    /* ..httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient();
          client.findProxy = (uri) {
            // Proxy all request to localhost:8888.
            // Be aware, the proxy should went through you running device,
            // not the host platform.
            return 'PROXY proxy.it-local:3129';
          };
          client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
          return client;
        },
      )*/

    /// Add the interceptor
      //..interceptors.add(DioInterceptor());
  }

}
