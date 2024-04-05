import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pallets_taxi_driver_pannel/common/snackbar.dart';
import 'package:pallets_taxi_driver_pannel/controller/auth_controller.dart';
import 'package:pallets_taxi_driver_pannel/controller/profile_controller.dart';
import 'package:pallets_taxi_driver_pannel/controller/spash_controller.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/user_model.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
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
              if (user != null) {
                ProfileController.find.updateProfile(
                  name: user.name,
                  phone: user.phoneNumber,
                  email: user.email,
                  fcmToken: AuthController.find.deviceToken,
                );
              }
              goToDashboard(user);
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
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [primaryLight, primaryColor],
        ),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100.sp),
          child: Image.asset(Images.splashImage),
        ),
      ),
    ));
  }
}
