import '../../domain/repositories/splash_repositories.dart';

import 'package:myapp/core/preferences/preferences_repository.dart';
import 'dart:io';
import 'package:android_content_provider/android_content_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:myapp/features/splash/data/models/device_model.dart';

class SplashRepositoriesImpl implements SplashRepositories {
  final PreferencesRepository preferencesRepository;

  SplashRepositoriesImpl({required this.preferencesRepository});

  @override
  Future<bool> initializeDeviceInfo() async {
    if (Platform.isAndroid) {
      try {
        final bundleDevice = await AndroidContentResolver.instance.call(
          uri:
              "content://com.chronopost.hub.providers.DeviceContentProvider/device",
          method: "device",
        );

        final bundleAgency = await AndroidContentResolver.instance.call(
          uri:
              "content://com.chronopost.hub.providers.DeviceContentProvider/agency",
          method: "agency",
        );

        if (bundleAgency != null && bundleDevice != null) {
          final serial = bundleDevice['SERIAL'].toString();
          final imei = bundleDevice['IMEI'].toString();

          final deviceModel = DeviceModel(
            trigram: bundleAgency['TRIGRAM'].toString(),
            serial: serial,
            imei: imei,
            env: bundleDevice['ENV'].toString(),
            agencyAccount: bundleAgency['ACCOUNT'].toString(),
          );

          debugPrint("TAG deviceModel $deviceModel");

          await preferencesRepository.saveImei(imei);
          await preferencesRepository.saveSerial(serial);

          return true;
        }
      } catch (e) {
        debugPrint("No content provider found : $e");
        return false;
      }
    }

    return false;
  }
}
