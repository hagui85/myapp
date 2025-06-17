import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/core/di/injection_container.dart';
import 'package:myapp/core/ui/theme/app_theme.dart';
import 'package:myapp/features/splash/presentation/pages/splash_page.dart';
import 'package:myapp/quiz_section.dart';
import 'package:myapp/features/videoPlayer/presentation/widgets/video_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:adaptive_theme/adaptive_theme.dart' as adaptive_theme;

import 'package:myapp/features/authentication/presentation/pages/authentication_page.dart';
import 'package:myapp/core/di/injection_locator.dart';
import 'package:myapp/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:myapp/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:myapp/core/router/router.dart' as my_router;
import 'package:myapp/core/ui/theme/theme.dart';
import 'package:myapp/features/splash/presentation/cubit/connectivity_cubit.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
void main() async {
  return runZonedGuarded(
    () async {
      // Ensuring that all the widgets have been initialized.
      WidgetsFlutterBinding.ensureInitialized();
      await init();
      runApp(const MyApp());
    },
    (error, stack) {
      // Printing the error and stack trace in case of an uncaught exception.
      debugPrint(stack.toString());
      debugPrint(error.toString());
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// This widget is the root of your application.
// _MyAppState is the state object for MyApp widget.
class _MyAppState extends State<MyApp> {
  final _chronoTheme = const ChronoTheme(TextTheme());
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Language Management Bloc
        //  BlocProvider<LanguageCubit>(
        //  create: (context) => getIt<LanguageCubit>(),
        //),
        // Authentication Management Bloc
        BlocProvider<AuthenticationCubit>(
          create: (context) => getIt<AuthenticationCubit>(),
        ),
        // Splash Screen Management Bloc
        BlocProvider<SplashCubit>(create: (context) => getIt<SplashCubit>()),
        // Connectivity Management Bloc
        BlocProvider<ConnectivityCubit>(
          create: (context) => getIt<ConnectivityCubit>(),
        ),
      ],
      child: AppTheme(
        child: Builder(
          builder: (context) {
            // Adaptive Theme for Light and Dark Mode
            return adaptive_theme.AdaptiveTheme(
              debugShowFloatingThemeButton: false,
              light: _chronoTheme.light(),
              dark: _chronoTheme.dark(),
              initial: adaptive_theme.AdaptiveThemeMode.light,
              builder: (theme, darkTheme) => MaterialApp(
                debugShowCheckedModeBanner: false,
                title:
                    AppTheme.of(context)?.values.appName ?? "Default App Name",
                theme: theme,
                darkTheme: darkTheme,
                // Application Routing
                onGenerateRoute: my_router.Router.generateRoute,
                // Localization Delegates and Supported Locales
                localizationsDelegates: const [
                  // AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                // supportedLocales: AppLocalizations.supportedLocales,
                //locale: context.watch<LanguageCubit>().state.locale == LanguageEnum.fr ? const Locale.fromSubtags(languageCode: 'fr') : const Locale.fromSubtags(languageCode: 'en'),
              ),
            );
          },
        ),
      ),
    );
  }
}
