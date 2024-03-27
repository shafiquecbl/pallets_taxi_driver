import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pallets_taxi_driver_pannel/data/api/api_client.dart';
import 'package:pallets_taxi_driver_pannel/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DocumentRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  DocumentRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response?> getSubmittedDocument() async =>
      await apiClient.getData(AppConstants.SUBMITTED_DOCUMENTS);

  Future<Response?> submitDocuments(XFile data, int id) async {
    return await apiClient.postMultipartData(
      AppConstants.SUBMIT_DOCUMENTS,
      [MultipartBody('driver_document', data)],
      body: {"document_id": id.toString()},
    );
  }
}
