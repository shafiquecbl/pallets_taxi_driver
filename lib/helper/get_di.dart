import 'package:pallets_taxi_driver_pannel/controller/auth_controller.dart';
import 'package:pallets_taxi_driver_pannel/controller/dashboard_controller.dart';
import 'package:pallets_taxi_driver_pannel/controller/document_controller.dart';
import 'package:pallets_taxi_driver_pannel/controller/history_controller.dart';
import 'package:pallets_taxi_driver_pannel/controller/location_controller.dart';
import 'package:pallets_taxi_driver_pannel/controller/profile_controller.dart';
import 'package:pallets_taxi_driver_pannel/controller/request_controller.dart';
import 'package:pallets_taxi_driver_pannel/controller/ride_controller.dart';
import 'package:pallets_taxi_driver_pannel/controller/spash_controller.dart';
import 'package:pallets_taxi_driver_pannel/controller/theme_controller.dart';
import 'package:pallets_taxi_driver_pannel/data/api/api_client.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/auth_repo.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/document_repo.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/history_repo.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/location_repo.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/profile_repo.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/ride_repo.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/splash_repo.dart';
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

  Get.lazyPut(
      () => SplashRepo(sharedPreferences: Get.find(), apiClient: Get.find()));
  Get.lazyPut(
      () => AuthRepo(sharedPreferences: Get.find(), apiClient: Get.find()));
  Get.lazyPut(() => ProfileRepo(apiClient: Get.find()));
  Get.lazyPut(() => DocumentRepo(apiClient: Get.find()));
  Get.lazyPut(() => HistoryRepo(apiClient: Get.find()));
  Get.lazyPut(() => RideRepo(apiClient: Get.find()));
  Get.lazyPut(() => LocationRepo(apiClient: Get.find()));

  // Controller
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => SplashController(splashRepo: Get.find()));
  Get.lazyPut(() => DashboardController());
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => ProfileController(profileRepo: Get.find()));
  Get.lazyPut(() => DocumentController(documentRepo: Get.find()));
  Get.lazyPut(() => HistoryController(historyRepo: Get.find()));
  Get.lazyPut(() => RideController(rideRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));
  Get.lazyPut(() => RequestsController(rideRepo: Get.find()));
}
