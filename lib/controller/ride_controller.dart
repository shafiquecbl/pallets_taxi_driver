import 'dart:convert';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:pallets_taxi_driver_pannel/common/snackbar.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/ride_request.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/ride_repo.dart';

class RideController extends GetxController implements GetxService {
  final RideRepo rideRepo;
  RideController({required this.rideRepo});
  static RideController get find => Get.find<RideController>();

  RideRequest? _rideRequest;
  final Set<Marker> _markers = <Marker>{};

  RideRequest? get rideRequest => _rideRequest;
  Set<Marker> get markers => _markers;

  set rideRequest(RideRequest? value) {
    _rideRequest = value;
    update();
  }

  set markers(Set<Marker> value) {
    markers.clear();
    update();
    markers.addAll(value);
    update();
  }

  Future<void> getCurrentRideRequest() async {
    http.Response? response = await rideRepo.getCurrentRideRequest();
    if (response != null) {
      Map<String, dynamic> map = jsonDecode(response.body);
      rideRequest = RideRequest.fromJson(map);
    }
  }

  Future<void> rideRequestUpdate(String status, {String? otp}) async {
    showLoading();
    http.Response? response = await rideRepo
        .rideRequestUpdate(rideRequest!.onRideRequest!.id, status, otp: otp);
    if (response != null) {
      getCurrentRideRequest();
    }
  }
}
