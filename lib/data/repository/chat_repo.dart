import 'dart:async';
import 'package:http/http.dart';
import 'package:pallets_taxi_driver_pannel/data/api/api_client.dart';
import 'package:pallets_taxi_driver_pannel/utils/app_constants.dart';

class ChatRepo {
  final ApiClient apiClient;
  ChatRepo({required this.apiClient});

  Future<Response?> getMessage(int offset, int rideId) async =>
      await apiClient.getData(
          '${AppConstants.MESSAGE_URI}?ride_request_id=$rideId?offset=$offset&limit=100');

  Future<Response?> sendMessage(
      String message, List<MultipartBody> images, int rideId) async {
    Map<String, String> fields = {};
    fields.addAll({'message': message, "ride_request_id": rideId.toString()});
    return await apiClient
        .postMultipartData(AppConstants.SEND_MESSAGE_URI, images, body: fields);
  }
}
