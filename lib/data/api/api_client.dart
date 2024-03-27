// ignore_for_file: no_leading_underscores_for_local_identifiers, unnecessary_null_comparison, constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pallets_taxi_driver_pannel/common/snackbar.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/error.dart';
import 'package:pallets_taxi_driver_pannel/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetxService {
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;
  static const String noInternetMessage =
      'Connection to API server failed due to internet connection';
  final int timeoutInSeconds = 30;

  String? token;

  Map<String, String> _mainHeaders = {
    "Content-Type": "application/json",
    'Accept': 'application/json',
  };

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    token = sharedPreferences.getString(AppConstants.TOKEN);
    debugPrint('Token: $token');

    updateHeader(
      token ?? '',
      sharedPreferences.getString(AppConstants.LANGUAGE_CODE) ??
          AppConstants.languages[0].languageCode,
    );
  }

  void updateHeader(String token, String? languageCode) {
    token = token;
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      AppConstants.LOCALIZATION_KEY:
          languageCode ?? AppConstants.languages[0].languageCode,
      'Authorization': 'Bearer $token',
    };
  }

  Future<http.Response?> getData(
    String uri, {
    Map<String, String>? headers,
    bool dismis = true,
  }) async {
    try {
      debugPrint(
          '====> API Call: ${AppConstants.BASE_URL + uri}\nHeader: $_mainHeaders');
      http.Response response = await http
          .get(Uri.parse(AppConstants.BASE_URL + uri),
              headers: headers ?? _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));

      if (response.statusCode != 200) {
        return handleError(jsonDecode(response.body), response.statusCode);
      } else {
        if (dismis) {
          dismiss();
        }
        return response;
      }
    } catch (e) {
      dismiss();
      socketException(e, AppConstants.BASE_URL + uri);
      return null;
    }
  }

  Future<http.Response?> postData(
    String uri,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
  }) async {
    try {
      debugPrint(
          '====> API Call: ${AppConstants.BASE_URL + uri}\nHeader:  ${headers ?? _mainHeaders}');
      debugPrint('====> API Body: $body');
      http.Response response = await http
          .post(
            Uri.parse(AppConstants.BASE_URL + uri),
            body: jsonEncode(body),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      if (response.statusCode != 200) {
        return handleError(jsonDecode(response.body), response.statusCode);
      } else {
        dismiss();
        return response;
      }
    } catch (e) {
      dismiss();
      socketException(e, AppConstants.BASE_URL + uri);
      return null;
    }
  }

  Future<http.Response?> postMultipartData(
    String uri,
    List<MultipartBody> multipartBody, {
    Map<String, String>? body,
    Map<String, String>? headers,
  }) async {
    try {
      debugPrint(
          '====> API Call: ${AppConstants.BASE_URL + uri}\nHeader: $_mainHeaders');
      debugPrint('====> API Body: $body');
      http.MultipartRequest _request =
          http.MultipartRequest('POST', Uri.parse(AppConstants.BASE_URL + uri));
      _request.headers.addAll(headers ?? _mainHeaders);
      for (MultipartBody multipart in multipartBody) {
        if (multipart.file != null) {
          File _file = File(multipart.file.path);
          _request.files.add(
            http.MultipartFile(
              multipart.key,
              _file.readAsBytes().asStream(),
              _file.lengthSync(),
              filename: _file.path.split('/').last,
            ),
          );
        }
      }
      if (body != null) {
        _request.fields.addAll(body);
      }
      http.Response response =
          await http.Response.fromStream(await _request.send());
      if (response.statusCode != 200) {
        return handleError(jsonDecode(response.body), response.statusCode);
      } else {
        dismiss();
        return response;
      }
    } catch (e) {
      dismiss();
      socketException(e, AppConstants.BASE_URL + uri);
      return null;
    }
  }

  Future<http.Response?> putData(
    String uri,
    Map<String, dynamic> body, {
    Map<String, String>? headers,
  }) async {
    try {
      debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      debugPrint('====> API Body: $body');
      http.Response response = await http
          .put(
            Uri.parse(AppConstants.BASE_URL + uri),
            body: jsonEncode(body),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      if (response.statusCode != 200) {
        return handleError(jsonDecode(response.body), response.statusCode);
      } else {
        dismiss();
        return response;
      }
    } catch (e) {
      dismiss();
      socketException(e, AppConstants.BASE_URL + uri);
      return null;
    }
  }

  Future<http.Response?> deleteData(
    String uri, {
    Map<String, String>? headers,
  }) async {
    try {
      debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      http.Response response = await http
          .delete(
            Uri.parse(AppConstants.BASE_URL + uri),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));

      if (response.statusCode != 200) {
        return handleError(jsonDecode(response.body), response.statusCode);
      } else {
        dismiss();
        return response;
      }
    } catch (e) {
      dismiss();
      socketException(e, AppConstants.BASE_URL + uri);
      return null;
    }
  }

  Future<Uint8List?> downloadImage(String uri) async {
    try {
      debugPrint('====> API Call: $uri\nHeader:  $_mainHeaders');
      http.Response response = await http
          .get(
            Uri.parse(uri),
            headers: _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      if (response.statusCode != 200) {
        return handleError(jsonDecode(response.body), response.statusCode);
      } else {
        dismiss();
        return Uint8List.fromList(response.bodyBytes);
      }
    } catch (e) {
      dismiss();
      socketException(e, AppConstants.BASE_URL + uri);
      return null;
    }
  }

  handleError(Map<String, dynamic> body, int statusCode) {
    String message = body['message'];
    if (statusCode == 401 && message == 'Invalid credentials.') {
      // SplashController.find.removeSharedData();
      // launchScreen(const LoginScreen(), pushAndRemove: true);
    }
    dismiss();
    showToast(message);
    return null;
  }

  socketException(Object e, String url) {
    if (e is SocketException) {
      showToast('Please check your internet connection');
    } else {
      log("Error Url: $url,\nError:${e.toString()}");
      showToast('Something went wrong');
    }
  }
}

class MultipartBody {
  String key;
  XFile file;
  MultipartBody(this.key, this.file);
}

String getError(Map<String, dynamic> body) {
  ErrorResponse errorResponse = ErrorResponse.fromJson(body);
  return errorResponse.errors.first.message;
}
