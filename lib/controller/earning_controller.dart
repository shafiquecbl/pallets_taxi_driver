import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/earning_repo.dart';
import 'package:http/http.dart' as http;

class EarningController extends GetxController implements GetxService {
  final EarningRepo earningRepo;
  EarningController({required this.earningRepo});
  static EarningController get find => Get.find<EarningController>();

  Future<void> getDriverEarnings(String type) async {
    http.Response? response = await earningRepo.getDriverEarnings(type);
    if (response != null) {
      var data = jsonDecode(response.body);
      log('Earning Data: $data');
    } else {
      log('Earning Data: No Data');
    }
  }
}
