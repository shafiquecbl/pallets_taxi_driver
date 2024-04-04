import 'package:http/http.dart';
import 'package:pallets_taxi_driver_pannel/data/api/api_client.dart';
import 'package:pallets_taxi_driver_pannel/utils/app_constants.dart';

class RideRepo {
  final ApiClient apiClient;
  RideRepo({required this.apiClient});

  Future<Response?> getCurrentRideRequest() async =>
      await apiClient.getData(AppConstants.CURRENT_RIDE_REQUEST);

  Future<Response?> rideRequestResponse(int rideId, bool accept) async {
    Map<String, dynamic> body = {"id": rideId, "is_accept": accept ? 1 : 0};
    return await apiClient.postData(AppConstants.RIDE_REQUEST_RESPONSE, body);
  }

  Future<Response?> rideRequestUpdate(int rideId, String status,
      {String? otp}) async {
    var body = {"status": status};
    if (otp != null) {
      body['otp'] = otp;
    }
    return await apiClient.postData(
        '${AppConstants.RIDE_REQUEST_UPDATE}/$rideId', body);
  }
}
