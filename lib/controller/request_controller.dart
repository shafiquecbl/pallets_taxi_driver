import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:pallets_taxi_driver_pannel/common/snackbar.dart';
import 'package:pallets_taxi_driver_pannel/controller/profile_controller.dart';
import 'package:pallets_taxi_driver_pannel/controller/ride_controller.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/ride_request.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/ride_repo.dart';
import 'package:pallets_taxi_driver_pannel/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class RequestsController extends GetxController implements GetxService {
  final RideRepo rideRepo;
  RequestsController({required this.rideRepo});
  static RequestsController get find => Get.find<RequestsController>();

  final client = MqttServerClient.withPort("broker.hivemq.com", "", 1883);

  final List<OnRideRequest> _rideRequest = <OnRideRequest>[];
  final Set<Marker> _markers = <Marker>{};

  List<OnRideRequest> get rideRequest => _rideRequest;
  Set<Marker> get markers => _markers;

  Future<void> rideRequestResponse(int rideId, bool accept) async {
    showLoading();
    http.Response? response =
        await rideRepo.rideRequestResponse(rideId, accept);
    if (response != null) {
      _rideRequest.removeWhere((element) => element.id == rideId);
      showToast('Ride request ${accept ? 'accepted' : 'rejected'}');
      if (accept) {
        RideController.find.getCurrentRideRequest();
      }
      update();
    }
  }

  mqttForDriver() async {
    client.setProtocolV311();
    client.logging(on: true);
    client.keepAlivePeriod = 120;
    client.autoReconnect = true;

    try {
      await client.connect();
    } on NoConnectionException catch (e) {
      debugPrint(e.toString());
      client.connect();
    }

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      client.onSubscribed = onSubscribed;
      onConnected();
    } else {
      client.connect();
    }

    client.subscribe(
      '${AppConstants.APP_NAME}_new_ride_request_${ProfileController.find.userModel?.id}',
      MqttQos.atLeastOnce,
    );

    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final MqttPublishMessage recMess = c![0].payload as MqttPublishMessage;

      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      var data = jsonDecode(pt);
      log(data.toString());
      OnRideRequest ride = OnRideRequest.fromJson(data['result']);
      _rideRequest.removeWhere((element) => element.id == ride.id);
      _rideRequest.add(ride);
      update();
    });

    client.onConnected = onConnected;
  }

  void onConnected() => log('Connected');

  void onSubscribed(String topic) =>
      log('Subscription confirmed for topic $topic');
}
