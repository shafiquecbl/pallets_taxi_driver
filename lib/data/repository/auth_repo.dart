import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:pallets_taxi_driver_pannel/common/snackbar.dart';
import 'package:pallets_taxi_driver_pannel/data/api/api_client.dart';
import 'package:pallets_taxi_driver_pannel/data/model/body/singup_model.dart';
import 'package:pallets_taxi_driver_pannel/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response?> registration(SignUpModel signUpModel) async =>
      await apiClient.postData(AppConstants.REGISTER_URI, signUpModel.toJson());

  Future<Response?> login(
          {required String email, required String password}) async =>
      await apiClient.postData(AppConstants.LOGIN_URI,
          {"email": email, "password": password, "user_type": "driver"});

  // for  user token
  Future<void> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(
        token, sharedPreferences.getString(AppConstants.LANGUAGE_CODE));
    await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<String> getDeviceToken() async {
    await FirebaseMessaging.instance.requestPermission();
    FirebaseMessaging.instance.subscribeToTopic(AppConstants.TOPIC);
    String? deviceToken;
    try {
      deviceToken = await FirebaseMessaging.instance.getToken();
    } catch (e) {
      showToast('Failed to get token');
    }
    debugPrint('--------Device Token---------- $deviceToken');
    return deviceToken ?? '';
  }

  bool get isLoggedIn => sharedPreferences.containsKey(AppConstants.TOKEN);

  Future<bool> clearSharedData() async {
    await sharedPreferences.remove(AppConstants.TOKEN);
    return true;
  }
}
