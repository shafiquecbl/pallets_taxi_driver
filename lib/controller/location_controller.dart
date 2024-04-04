// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pallets_taxi_driver_pannel/common/snackbar.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/location_repo.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/location/widgets/location_bottom_sheets.dart';

class LocationController extends GetxController implements GetxService {
  final LocationRepo locationRepo;
  LocationController({required this.locationRepo});
  static LocationController get find => Get.find<LocationController>();

  StreamSubscription<Position>? positionStream;

  @override
  void onClose() {
    positionStream?.cancel();
    super.onClose();
  }

  void checkPermission(Function callback) async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    } else if (permission == LocationPermission.deniedForever) {
      showLocationDialog(onTab: Geolocator.openAppSettings);
    } else {
      callback();
    }
  }

  void getCurrentPosition(Function(Position position) callback,
      {bool isLoading = false}) {
    checkPermission(() async {
      if (isLoading) {
        showLoading();
      }
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      if (isLoading) {
        dismiss();
      }
      callback(position);
    });
  }

  getLocationStream(Function(LatLng position) callback) {
    checkPermission(() async {
      if (positionStream != null) positionStream?.cancel();
      positionStream = Geolocator.getPositionStream(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
        intervalDuration: const Duration(seconds: 15),
      ).listen((position) {
        callback(LatLng(position.latitude, position.longitude));
      });
    });
  }

  updateDriverLocation(LatLng position) async =>
      await locationRepo.updateDriverLocation(position);
}
