import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pallets_taxi_driver_pannel/data/api/api_client.dart';
import 'package:pallets_taxi_driver_pannel/utils/app_constants.dart';

class ProfileRepo {
  final ApiClient apiClient;
  ProfileRepo({required this.apiClient});

  Future<Response?> getProfile() async =>
      await apiClient.getData(AppConstants.PROFILE_URI);

  Future<Response?> updateProfile(
      {required String name,
      required String phone,
      required String email,
      String? fcmToken,
      XFile? image}) async {
    List<String> splitName = name.split(' ');
    String firstName = splitName.first;
    String lastName = splitName.skip(1).join(' ');
    var body = {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "contact_number": phone,
    };
    if (fcmToken != null) {
      body['fcm_token'] = fcmToken;
    }
    if (image != null) {
      return await apiClient.postMultipartData(
        AppConstants.UPDATE_PROFILE_URI,
        [MultipartBody('profile_image', image)],
        body: body,
      );
    } else {
      return await apiClient.postData(AppConstants.UPDATE_PROFILE_URI, body);
    }
  }
}
