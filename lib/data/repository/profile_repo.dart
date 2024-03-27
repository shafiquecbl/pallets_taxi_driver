import 'package:http/http.dart';
import 'package:pallets_taxi_driver_pannel/data/api/api_client.dart';
import 'package:pallets_taxi_driver_pannel/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  ProfileRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response?> getProfile() async =>
      await apiClient.getData(AppConstants.PROFILE_URI);
}
