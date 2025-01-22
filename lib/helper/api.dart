import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "there is a problem in status code ${response.statusCode}");
    }
  }
}
