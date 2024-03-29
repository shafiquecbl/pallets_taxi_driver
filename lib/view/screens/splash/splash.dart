import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/common/snackbar.dart';
import 'package:pallets_taxi_driver_pannel/controller/auth_controller.dart';
import 'package:pallets_taxi_driver_pannel/controller/profile_controller.dart';
import 'package:pallets_taxi_driver_pannel/controller/spash_controller.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/user_model.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/dashboard/dashboard_screen.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/document_verification/document_verification.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/waiting_screen/waiting_screen.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/welcome/welcome.dart';

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
    AuthController.find.getToken();
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
    _onConnectivityChanged?.cancel();
  }

  init() {
    _onConnectivityChanged = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      bool isNotConnected = result != ConnectivityResult.wifi &&
          result != ConnectivityResult.mobile;
      showToast(
        isNotConnected ? 'No Connection' : 'Connected',
        success: !isNotConnected,
      );
      if (!isNotConnected) {
        _route();
      }
    });

    _splashController.initSharedData();
    _route();
  }

  void _route() {
    AuthController authController = AuthController.find;
    _splashController.getAppSettings().then(
      (bool isSuccess) {
        if (isSuccess) {
          Timer(const Duration(seconds: 1), () async {
            if (authController.isLoggedIn) {
              UserModel? user = await ProfileController.find.getProfile();
              if (user != null && user.isDocumentRequired) {
                launchScreen(const DocumentVerificationScreen(),
                    pushAndRemove: true);
              } else if (user != null &&
                  user.isVerifiedDriver == false &&
                  user.status == 'pending') {
                launchScreen(const WaitingScreen(), pushAndRemove: true);
              } else {
                launchScreen(const DashboardScreen(), pushAndRemove: true);
              }
            } else {
              launchScreen(const WelcomeScreen(), pushAndRemove: true);
            }
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
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
