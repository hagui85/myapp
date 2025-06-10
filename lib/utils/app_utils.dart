import 'package:flutter/foundation.dart';
import 'package:myapp/core/resources/app_strings.dart';

class AppUtils {
  // ignore: empty_constructor_bodies
  static Future<String> getBaseUrl(String endPoint) async {
    //SharedPreferenceHelper sharedPreferencesHelper = getIt<SharedPreferenceHelper>();
    var baseUrl = "";

    //var developerMode = await sharedPreferencesHelper.getDeveloperMode;

    if (kDebugMode) {
      baseUrl = AppStrings.PFI_URL;
    } else {
      baseUrl = AppStrings.PROD_URL;
    }

    return baseUrl + endPoint;
  }
}
