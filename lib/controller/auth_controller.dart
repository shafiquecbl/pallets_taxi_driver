import 'dart:convert';
import 'package:get/get.dart';
import 'package:pallets_taxi_driver_pannel/common/snackbar.dart';
import 'package:pallets_taxi_driver_pannel/controller/profile_controller.dart';
import 'package:pallets_taxi_driver_pannel/data/model/body/singup_model.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/response_model.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/user_model.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/auth_repo.dart';
import 'package:http/http.dart' as http;
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/welcome/welcome.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});
  static AuthController get find => Get.find<AuthController>();

  String? _deviceToken;

  String? get deviceToken => _deviceToken;
  bool get isLoggedIn => authRepo.isLoggedIn;

  set deviceToken(String? value) {
    _deviceToken = value;
    update();
  }

  Future<ResponseModel> registration(SignUpModel signUpModel) async {
    signUpModel = signUpModel.copyWith(deviceToken: deviceToken);
    showLoading();
    http.Response? response = await authRepo.registration(signUpModel);
    ResponseModel responseModel;
    if (response != null) {
      Map<String, dynamic> map = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(map["data"]);
      authRepo.saveUserToken(user.token);
      responseModel = successResponse;
    } else {
      responseModel = failedResponse;
    }
    return responseModel;
  }

  Future<ResponseModel> login(String email, String password) async {
    showLoading();
    http.Response? response =
        await authRepo.login(email: email, password: password);
    ResponseModel responseModel;
    if (response != null) {
      Map<String, dynamic> map = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(map["data"]);
      authRepo.saveUserToken(user.token);
      responseModel = successResponse;
    } else {
      responseModel = failedResponse;
    }
    return responseModel;
  }

  Future<void> getToken() async {
    deviceToken = await authRepo.getDeviceToken();
  }

  Future<void> logout() async {
    authRepo.clearSharedData();
    ProfileController.find.userModel = null;
    ProfileController.find.update();
    launchScreen(const WelcomeScreen(), pushAndRemove: true);
  }
}
