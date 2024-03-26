import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/common/snackbar.dart';
import 'package:pallets_taxi_driver_pannel/controller/spash_controller.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/welcome/welcome_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  StreamSubscription<ConnectivityResult>? _onConnectivityChanged;
  SplashController get _splashController => SplashController.find;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
    _onConnectivityChanged?.cancel();
  }

  init() {
    bool firstTime = true;
    _onConnectivityChanged = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (!firstTime) {
        bool isNotConnected = result != ConnectivityResult.wifi &&
            result != ConnectivityResult.mobile;
        showToast(
          isNotConnected ? 'No Connection' : 'Connected',
          success: !isNotConnected,
        );
        if (!isNotConnected) {
          _route();
        }
      }
      firstTime = false;
    });

    _splashController.initData();
    _route();
  }

  void _route() {
    Timer(const Duration(seconds: 3), () {
      launchScreen(const WelcomeScreen(), pushAndRemove: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(Images.splashImage),
          ),
        ],
      ),
    );
  }
}
