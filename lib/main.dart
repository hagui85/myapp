import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/core/di/injection_container.dart';
import 'package:myapp/core/ui/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myapp/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:myapp/features/chewie_video/presentation/cubit/chewie_video_cubit.dart';
import 'package:myapp/features/chewie_video/presentation/cubit/video_list_cubit.dart';
import 'package:myapp/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:myapp/core/router/router.dart' as my_router;
import 'package:myapp/core/ui/theme/chrono_theme.dart';
import 'package:myapp/features/splash/presentation/cubit/connectivity_cubit.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() async {
  return runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await init();
      runApp(const MyApp());
    },
    (error, stack) {
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

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<SplashCubit>()),
        BlocProvider(create: (_) => getIt<ConnectivityCubit>()),
        BlocProvider(create: (_) => getIt<AuthenticationCubit>()),
        BlocProvider(create: (_) => getIt<VideoListCubit>()),
        BlocProvider(create: (_) => getIt<ChewieVideoCubit>()),
      ],
      child: AppTheme(
        // Injecte le thème ici
        themeData: ChronoTheme.light,
        child: Builder(
          builder: (context) {
            final themeData = AppTheme.of(context)!.themeData;

            return MaterialApp(
              navigatorObservers: [routeObserver],
              debugShowCheckedModeBanner: false,
              title: AppTheme.of(context)?.values.appName ?? "Default App Name",
              theme: ChronoTheme.light,
              darkTheme: ChronoTheme.dark,
              themeMode:
                  ThemeMode.system, // peut être light/dark si tu veux forcer
              onGenerateRoute: my_router.Router.generateRoute,
              localizationsDelegates: const [
                // AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              // supportedLocales: AppLocalizations.supportedLocales,
              // locale: ... gestion locale si besoin,
            );
          },
        ),
      ),
    );
  }
}
