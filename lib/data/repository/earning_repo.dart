import 'package:http/http.dart';
import 'package:pallets_taxi_driver_pannel/data/api/api_client.dart';
import 'package:pallets_taxi_driver_pannel/utils/app_constants.dart';

class EarningRepo {
  final ApiClient apiClient;
  EarningRepo({required this.apiClient});

  Future<Response?> getDriverEarnings() async =>
      await apiClient.getData(AppConstants.EARNING_URI);
}
