import 'package:pallets_taxi_driver_pannel/controller/spash_controller.dart';
import 'package:pallets_taxi_driver_pannel/controller/theme_controller.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/splash_repo.dart';
import 'package:pallets_taxi_driver_pannel/helper/network_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  // Repository

  Get.put(NetworkManager());
  Get.lazyPut(() => SplashRepo(sharedPreferences: Get.find()));

  // Controller
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => SplashController(splashRepo: Get.find()));
}
