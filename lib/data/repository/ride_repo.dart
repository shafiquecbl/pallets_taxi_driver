import 'package:http/http.dart';
import 'package:pallets_taxi_driver_pannel/data/api/api_client.dart';
import 'package:pallets_taxi_driver_pannel/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RideRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  RideRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response?> getCurrentRideRequest() async =>
      await apiClient.getData(AppConstants.CURRENT_RIDE_REQUEST);
}
