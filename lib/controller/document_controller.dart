import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pallets_taxi_driver_pannel/common/snackbar.dart';
import 'package:pallets_taxi_driver_pannel/controller/profile_controller.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/document_model.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/document_repo.dart';

class DocumentController extends GetxController implements GetxService {
  final DocumentRepo documentRepo;
  DocumentController({required this.documentRepo});
  static DocumentController get find => Get.find<DocumentController>();

  List<DocumentModel> _documents = [];
  final List<SubmittedDocument> _submittedDocuments = [];
  bool _loading = false;

  List<DocumentModel> get documents => _documents;
  List<SubmittedDocument> get submittedDocuments => _submittedDocuments;
  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    update();
  }

  set documents(List<DocumentModel> value) {
    _documents = value;
    update();
  }

  Future<void> getSubmittedDocuments({bool reload = true}) async {
    if (reload) {
      loading = true;
    }
    http.Response? response = await documentRepo.getSubmittedDocument();
    if (response != null) {
      Map<String, dynamic> map = jsonDecode(response.body);
      List data = map["data"];
      _submittedDocuments.clear();
      _submittedDocuments
          .addAll(data.map((e) => SubmittedDocument.fromJson(e)));
    }
    loading = false;
  }

  Future<void> submitDocument(XFile file, int docId) async {
    update();
    showLoading();
    http.Response? response = await documentRepo.submitDocuments(file, docId);
    if (response != null) {
      Future.wait([
        getSubmittedDocuments(reload: false),
        ProfileController.find.getProfile()
      ]);
      showToast("Document submitted successfully");
    } else {
      showToast("Failed to submit document");
    }
  }
}
