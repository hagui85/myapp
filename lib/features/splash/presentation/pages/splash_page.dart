import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:android_content_provider/android_content_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/authentication/presentation/pages/authentication_page.dart';
import 'package:myapp/features/splash/data/models/app_info.dart';
import 'package:myapp/features/splash/data/models/device_model.dart';
import 'package:myapp/features/splash/data/models/disc_data.dart';
import 'package:myapp/features/splash/presentation/cubit/connectivity_cubit.dart';

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
  late Timer _timerNavigation;

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

    _timerNavigation = Timer(const Duration(seconds: 3), () {
      BlocProvider.of<ConnectivityCubit>(context).checkConnection();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _timerNavigation.cancel();
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
      body: BlocListener<ConnectivityCubit, ConnectivityStatus>(
        listener: (listenerContext, state) async {
          // Handle the state change here
          if (state == ConnectivityStatus.connected) {
            // Internet is connected
            Navigator.pushReplacementNamed(
              context,
              AuthenticationPage.AUTHENTICATION,
            );
          }
          if (state == ConnectivityStatus.disconnected) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("no_internet_connexion"),
                duration: const Duration(days: 365),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
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
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: SizedBox(
                  width: 200, // Adjust width as needed
                  height: 180, // Adjust height as needed
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeTransition(
                        opacity: _animation,
                        child: Image.asset(
                          'assets/images/splash_icon.png',
                          width: 100, // Adjust width as needed
                          height: 100, // Adjust height as needed
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        appInfo?.appName ?? 'Chrono Driver',
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
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> getHUBProvider() async {
    if (Platform.isAndroid) {
      try {
        final bundleDevice = await getDeviceBundleFromContentResolver();
        final bundleAgency = await getAgencyBundleFromContentResolver();
        if (bundleAgency != null && bundleDevice != null) {
          debugPrint("TAG deviceBundle ${bundleDevice.toString()}");
          String trigram = bundleAgency['TRIGRAM'].toString();
          String serial = bundleDevice['SERIAL'].toString();
          String imei = bundleDevice['IMEI'].toString();
          String env = bundleDevice['ENV'].toString();
          String agencyAccount = bundleAgency['ACCOUNT'].toString();

          final deviceModel = DeviceModel(
            trigram: trigram,
            serial: serial,
            imei: imei,
            env: env,
            agencyAccount: agencyAccount,
          );

          debugPrint("TAG deviceModel ${deviceModel.toString()}");

          //SharedPreferenceHelper sharedPreferencesHelper =
          //  getIt<SharedPreferenceHelper>();

          //sharedPreferencesHelper.saveDeviceModel(deviceModel);
          return true;
        }
      } catch (e) {
        debugPrint("No content provider found : $e");
        return false;
      }
    }
    return false;
  }

  Future<Map<String, Object?>?> getDeviceBundleFromContentResolver() async {
    final bundleAgency = await AndroidContentResolver.instance.call(
      uri:
          "content://com.chronopost.hub.providers.DeviceContentProvider/device",
      method: "device",
    );
    return bundleAgency;
  }

  Future<Map<String, Object?>?> getAgencyBundleFromContentResolver() async {
    final bundleDevice = await AndroidContentResolver.instance.call(
      uri:
          "content://com.chronopost.hub.providers.DeviceContentProvider/agency",
      method: "agency",
    );
    return bundleDevice;
  }
}
