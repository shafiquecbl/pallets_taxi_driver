import 'package:pallets_taxi_driver_pannel/controller/auth_controller.dart';
import 'package:pallets_taxi_driver_pannel/controller/document_controller.dart';
import 'package:pallets_taxi_driver_pannel/controller/profile_controller.dart';
import 'package:pallets_taxi_driver_pannel/controller/spash_controller.dart';
import 'package:pallets_taxi_driver_pannel/controller/theme_controller.dart';
import 'package:pallets_taxi_driver_pannel/data/api/api_client.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/auth_repo.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/document_repo.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/profile_repo.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/splash_repo.dart';
import 'package:pallets_taxi_driver_pannel/helper/network_manager.dart';
import 'package:pallets_taxi_driver_pannel/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  // Repository

  Get.put(NetworkManager());
  Get.lazyPut(
      () => SplashRepo(sharedPreferences: Get.find(), apiClient: Get.find()));
  Get.lazyPut(
      () => AuthRepo(sharedPreferences: Get.find(), apiClient: Get.find()));
  Get.lazyPut(
      () => ProfileRepo(sharedPreferences: Get.find(), apiClient: Get.find()));
  Get.lazyPut(
      () => DocumentRepo(sharedPreferences: Get.find(), apiClient: Get.find()));

  // Controller
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => SplashController(splashRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => ProfileController(profileRepo: Get.find()));
  Get.lazyPut(() => DocumentController(documentRepo: Get.find()));
}
