import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:pallets_taxi_driver_pannel/controller/ride_controller.dart';
import 'package:pallets_taxi_driver_pannel/data/api/api_client.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/chat_model.dart';
import 'package:pallets_taxi_driver_pannel/data/repository/chat_repo.dart';

class ChatController extends GetxController implements GetxService {
  final ChatRepo chatRepo;
  ChatController({required this.chatRepo});
  static ChatController get to => Get.find<ChatController>();

  List<XFile>? _imageFiles;
  List<XFile>? _chatImage = [];
  bool _isComposing = false;
  bool _isLoading = false;

  List<XFile>? get imageFiles => _imageFiles;
  bool get isComposing => _isComposing;
  List<Messages>? _messageList;
  List<Messages>? get messageList => _messageList;
  bool get isLoading => _isLoading;

  List<XFile>? get chatImage => _chatImage;

  set isComposing(bool value) {
    _isComposing = value;
    update();
  }

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  Future<void> getMessages(int offset, bool isFirst) async {
    http.Response? response;
    if (isFirst) {
      _messageList = null;
      update();
    }
    response = await chatRepo.getMessage(
        1, RideController.find.rideRequest!.onRideRequest!.id);

    if (response != null) {
      var data = jsonDecode(response.body);
      if (data['messages'] != null && data['messages'] != {}) {
        _messageList = [];
        _messageList?.addAll(ChatModel.fromJson(data).messages!);
      }
    }
    update();
  }

  void pickImage(bool isRemove) async {
    if (isRemove) {
      _imageFiles = [];
      _chatImage = [];
    } else {
      _imageFiles = await ImagePicker().pickMultiImage(imageQuality: 30);
      if (_imageFiles != null) {
        _chatImage = imageFiles;
        _isComposing = true;
      }
    }
    update();
  }

  void removeImage(int index) {
    chatImage!.removeAt(index);
    update();
  }

  Future<bool> sendMessage(String message) async {
    http.Response? response;
    isLoading = true;
    update();
    List<MultipartBody> images = [];
    if (imageFiles != null) {
      for (var item in imageFiles!) {
        images.add(MultipartBody('image[]', item));
      }
    }
    response = await chatRepo.sendMessage(
        message, images, RideController.find.rideRequest!.onRideRequest!.id);

    if (response != null) {
      getMessages(1, false);
      _imageFiles = [];
      _chatImage = [];
      _isComposing = false;
      isLoading = false;
      return true;
    } else {
      isLoading = false;
      return false;
    }
  }

  void setImageList(List<XFile> images) {
    _imageFiles = [];
    _imageFiles = images;
    _isComposing = true;
    update();
  }
}
