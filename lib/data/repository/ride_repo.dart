import 'package:http/http.dart';
import 'package:pallets_taxi_driver_pannel/controller/profile_controller.dart';
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

  Future<Response?> saveRideRating(Map<String, dynamic> body) {
    return apiClient.postData(AppConstants.SAVE_RIDE_RATING, body);
  }

  Future<Response?> completeRideRequest(Map<String, dynamic> body) {
    return apiClient.postData(AppConstants.COMPLETE_RIDE_REQUEST, body);
  }

  Future<Response?> savePayment(Map<String, dynamic> body) {
    return apiClient.postData(AppConstants.SAVE_PAYMENT, body);
  }

  Future<Response?> getRideRequestList(int perPage) async =>
      await apiClient.getData(
          '${AppConstants.RIDE_REQUEST_LIST}?driver_id=${ProfileController.find.userModel?.id}&per_page=$perPage');
}
