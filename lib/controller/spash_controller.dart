import 'dart:convert';
import 'package:get/get.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/app_setting.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/splash_repo.dart';
import 'package:http/http.dart' as http;

class SplashController extends GetxController implements GetxService {
  final SplashRepo splashRepo;
  SplashController({required this.splashRepo});

  // instance
  static SplashController get find => Get.find<SplashController>();

  AppSetting? _appSetting;

  AppSetting? get appSetting => _appSetting;

  Future<bool> getAppSettings() async {
    http.Response? response = await splashRepo.getAppSettings();
    bool isSuccess;
    if (response != null) {
      Map<String, dynamic> body = jsonDecode(response.body);
      _appSetting = AppSetting.fromJson(body);
      isSuccess = true;
      update();
    } else {
      isSuccess = false;
    }
    return isSuccess;
  }

  Future<bool> initSharedData() => splashRepo.initSharedData();
}
