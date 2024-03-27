import 'package:pallets_taxi_driver_pannel/data/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  HistoryRepo({required this.apiClient, required this.sharedPreferences});
}
