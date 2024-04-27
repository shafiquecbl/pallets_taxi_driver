import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:pallets_taxi_driver_pannel/firebase_options.dart';
import 'common/loading.dart';
import 'helper/get_di.dart' as di;
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pallets_taxi_driver_pannel/theme/light_theme.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/splash/splash.dart';

import 'helper/notification_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await di.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationHelper.initialize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.shortestSide > 600;
    final bool isLargeTablet = MediaQuery.of(context).size.shortestSide > 800;

    final Size designSize;

    if (isLargeTablet) {
      designSize = const Size(1024, 1366);
    } else if (isTablet) {
      designSize = const Size(768, 1024);
    } else {
      designSize = const Size(411.4, 867.4);
    }

    return ScreenUtilInit(
        designSize: designSize,
        minTextAdapt: true,
        splitScreenMode: true,
        fontSizeResolver: (size, util) {
          return size *
              (isTablet
                  ? 1.2
                  : isLargeTablet
                      ? 1.0
                      : util.scaleText);
        },
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: light(),
            navigatorObservers: [FlutterSmartDialog.observer],
            builder: FlutterSmartDialog.init(
                loadingBuilder: (string) => const Loading()),
            home: const SplashScreen(),
          );
        });
  }
}
