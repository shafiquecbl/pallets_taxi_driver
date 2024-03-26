import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ApiService extends GetxService {
  static const String baseUrl = 'https://api.example.com';

  Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$endpoint'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to post data');
    }
  }
}

Future<void> updateData(String id, Map<String, dynamic> updatedData) async {
  try {
    final String apiUrl = 'https://your-api-url.com/data/$id';

    String jsonData = json.encode(updatedData);
    final response = await http.put(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData,
    );

    if (response.statusCode == 200) {
      print('Data updated successfully');
    } else {
      print('Failed to update data. Error: ${response.reasonPhrase}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

Future<void> postDataWithImage(
    File imageFile, Map<String, dynamic> data) async {
  try {
    const String apiUrl = 'https://your-api-url.com/post';

    var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
    request.files
        .add(await http.MultipartFile.fromPath('image', imageFile.path));

    data.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    var streamedResponse = await request.send();

    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      print('Data posted successfully');
    } else {
      print('Failed to post data. Error: ${response.reasonPhrase}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
