import 'package:get/get.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/splash_repo.dart';

class SplashController extends GetxController implements GetxService {
  final SplashRepo splashRepo;
  SplashController({required this.splashRepo});

  // instance
  static SplashController get find => Get.find<SplashController>();

  Future<bool> initSharedData() => splashRepo.initSharedData();

  initData() async {
    await initSharedData();
  }
}
