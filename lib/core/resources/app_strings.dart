class AppStrings {
  AppStrings._();

  // receiveTimeout

  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // Add resource strings here.
  static const String PFI_URL = "https://psm-flowpfi.chronopost.fr/od/api/";
  static const String PROD_URL = "https://psm-flow.chronopost.fr/od/api/";
  // static const String PROD_URL = "https://xproto-chr.eu:50843/od/api/";
  static const String AUTH_URL_SUFFIX = "auth/login";
  static const String AUTH_URL_SUFFIX_FLOW = "auth/loginInDegradedMode";
}
