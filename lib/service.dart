import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<String?> getData(int offset) async {
    try {
      final url = "https://pokeapi.co/api/v2/pokemon?offset=$offset&limit=10'";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
      return null;
    }
  }
}
