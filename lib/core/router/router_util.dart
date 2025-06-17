import 'package:flutter/material.dart';
import 'package:myapp/core/router/routes.dart';

class AppRouter {
  static void navigateTo(BuildContext context, String routeName, {Object? arguments}) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static void navigateAndReplace(BuildContext context, String routeName, {Object? arguments}) {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  static void navigateAndRemoveUntil(BuildContext context, String routeName, {Object? arguments}) {
    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false, arguments: arguments);
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  static void navigateToSplash(BuildContext context) {
    navigateAndRemoveUntil(context, AppRoutes.splash);
  }

  static void navigateToAuthentication(BuildContext context) {
    navigateAndRemoveUntil(context, AppRoutes.authentication);
  }

  static void navigateToVideoPlayer(BuildContext context) {
    navigateAndRemoveUntil(context, AppRoutes.videoPlayer);
  }

  static void navigateToQuiz(BuildContext context) {
    navigateAndRemoveUntil(context, AppRoutes.quiz);
  }
}