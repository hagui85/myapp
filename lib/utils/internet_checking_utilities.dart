import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetCheckingUtilities {
  InternetCheckingUtilities();

  static Future<bool> checkInternetConnection() async {
    bool isConnected = await InternetConnection().hasInternetAccess;
    return isConnected;
  }
}