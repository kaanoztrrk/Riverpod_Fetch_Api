import 'dart:convert';

import 'package:reverpod_flutter/Model/UserModel.dart';
import 'package:http/http.dart' as http;

class Service {
  static const String _baseUrl = "https://reqres.in/api/users?page=2";

  static Future<UserModel?> fetch() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        print("HTTP Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Network Error: ${e.toString()}");
      return null;
    }
  }
}
