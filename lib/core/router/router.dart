import 'package:flutter/material.dart';
import 'package:myapp/core/router/router_utils.dart';
import 'package:myapp/features/authentication/presentation/pages/authentication_page.dart';
import 'package:myapp/features/splash/presentation/cubit/connectivity_cubit.dart';
import 'package:myapp/features/splash/presentation/pages/splash_page.dart';

class Router {
  /// The generateRoute method is responsible for generating routes based on the routeSettings.
  /// It returns a Route<dynamic> object which can be used by the Navigator to navigate to the appropriate page.
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    dynamic args = routeSettings.arguments;

    switch (routeSettings.name) {
      /// If the route name is '/', navigate to the SplashPage.
      case '/':
        return RouterUtils.buildRouteGeneric<ConnectivityCubit>(
          const SplashPage(20),
        );

      /// If the route name is AuthenticationPage.AUTHENTICATION, navigate to the AuthenticationPage.
      ///
      case AuthenticationPage.AUTHENTICATION:
        return RouterUtils.buildRouteGeneric<ConnectivityCubit>(
          const AuthenticationPage(),
        );

      /// If the route name is SettingsPage.routeName, navigate to the Settings page.
      // case SettingsPage.routeName:
      // return RouterUtils.buildRoute(const SettingsWidget());

      /// If the route name does not match any of the above, return a default route.
      default:
        return RouterUtils.buildRoute(
          Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
