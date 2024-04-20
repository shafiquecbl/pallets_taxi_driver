import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pallets_taxi_driver_pannel/data/model/response/ride_request.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/ride_repo.dart';

class HistoryController extends GetxController implements GetxService {
  final RideRepo rideRepo;
  HistoryController({required this.rideRepo});
  static HistoryController get find => Get.find<HistoryController>();

  final List<OnRideRequest> _rideHistory = [];
  bool _loading = false;
  int _currentIndex = 0;

  List<OnRideRequest> get rideHistory => _rideHistory;
  bool get loading => _loading;
  int get currentIndex => _currentIndex;

  set loading(bool value) {
    _loading = value;
    update();
  }

  set currentIndex(int value) {
    _currentIndex = value;
    update();
  }

  Future<void> getRideHistory() async {
    loading = true;
    _rideHistory.clear();
    http.Response? response = await rideRepo.getRideRequestList(50);
    if (response != null) {
      Map<String, dynamic> map = jsonDecode(response.body);
      List<dynamic> rideData = map['data'];
      _rideHistory.addAll(
          rideData.map((json) => OnRideRequest.fromJson(json)).toList());
      _rideHistory.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    }
    loading = false;
  }
}
