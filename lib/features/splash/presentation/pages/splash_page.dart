import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/authentication/presentation/pages/authentication_page.dart';
import 'package:myapp/features/splash/data/models/app_info.dart';
import 'package:myapp/features/splash/data/models/disc_data.dart';
import 'package:myapp/features/splash/presentation/cubit/connectivity_cubit.dart';
import 'package:myapp/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:myapp/features/splash/presentation/cubit/splash_state.dart';

class SplashPage extends StatefulWidget {
  final int numberOfDiscs;

  const SplashPage(this.numberOfDiscs, {super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AppInfo? appInfo;
  final _discs = <DiscData>[];
  final _rng = Random();

  late Timer _timer;
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _makeDiscs();
    _startAnimation();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.repeat(reverse: true);

    // Lancement de l'initialisation dans le SplashCubit après le premier build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashCubit>().initialize();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _makeDiscs();
      });
    });
  }

  void _makeDiscs() {
    _discs.clear();
    for (int i = 0; i < widget.numberOfDiscs; i++) {
      _discs.add(DiscData());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<SplashCubit, SplashState>(
            listener: (context, state) {
              if (state is SplashStateSuccess) {
                context.read<ConnectivityCubit>().checkConnection();
              } else if (state is SplashStateFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Erreur: ${state.error}')),
                );
              }
            },
          ),
          BlocListener<ConnectivityCubit, ConnectivityStatus>(
            listener: (context, status) {
              if (status == ConnectivityStatus.connected) {
                Navigator.pushReplacementNamed(
                  context,
                  AuthenticationPage.AUTHENTICATION,
                );
              } else if (status == ConnectivityStatus.disconnected) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("no_internet_connexion"),
                    duration: Duration(days: 365),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
        ],
        child: Stack(
          children: [
            for (final disc in _discs)
              Positioned(
                left: MediaQuery.of(context).size.width * _rng.nextDouble(),
                top: MediaQuery.of(context).size.height * _rng.nextDouble(),
                child: AnimatedAlign(
                  duration: disc.duration,
                  curve: Curves.bounceInOut,
                  alignment: disc.alignment,
                  child: AnimatedContainer(
                    duration: disc.duration,
                    decoration: BoxDecoration(
                      color: disc.color,
                      shape: BoxShape.circle,
                    ),
                    height: disc.size,
                    width: disc.size,
                  ),
                ),
              ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeTransition(
                      opacity: _animation,
                      child: Image.asset(
                        'assets/images/spalsh_icon.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      appInfo?.appName ?? 'Chrono Formation',
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      appInfo?.version ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
