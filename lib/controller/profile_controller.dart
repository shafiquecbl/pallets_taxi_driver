import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pallets_taxi_driver_pannel/common/snackbar.dart';
import 'package:pallets_taxi_driver_pannel/controller/document_controller.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/document_model.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/user_model.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/profile_repo.dart';

class ProfileController extends GetxController implements GetxService {
  final ProfileRepo profileRepo;
  ProfileController({required this.profileRepo});
  static ProfileController get find => Get.find<ProfileController>();

  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  set userModel(UserModel? value) {
    _userModel = value;
    update();
  }

  Future<UserModel?> getProfile() async {
    http.Response? response = await profileRepo.getProfile();
    if (response != null) {
      // User Data
      Map<String, dynamic> map = jsonDecode(response.body);
      userModel = UserModel.fromJson(map["data"]);
      // Required Document
      List documentsData = map["required_document"];
      DocumentController.find.documents =
          documentsData.map((e) => DocumentModel.fromJson(e)).toList();
      return userModel;
    }
    return null;
  }

  Future<void> updateProfile(
      {required String name,
      required String phone,
      required String email,
      XFile? file}) async {
    showLoading();
    http.Response? response = await profileRepo.updateProfile(
        name: name, phone: phone, email: email, image: file);
    if (response != null) {
      Map<String, dynamic> map = jsonDecode(response.body);
      userModel = UserModel.fromJson(map["data"]);
      showToast('Profile Updated Successfully');
    }
  }
}
