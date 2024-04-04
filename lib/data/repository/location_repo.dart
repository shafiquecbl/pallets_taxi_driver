import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:pallets_taxi_driver_pannel/data/api/api_client.dart';
import 'package:pallets_taxi_driver_pannel/utils/app_constants.dart';

class LocationRepo {
  final ApiClient apiClient;
  LocationRepo({required this.apiClient});

  Future<Response?> updateDriverLocation(LatLng latLng) async =>
      await apiClient.postData(AppConstants.UPDATE_DRIVER_LOCATION, {
        "latitude": latLng.latitude,
        "longitude": latLng.longitude,
        "is_online": 1
      });
}
