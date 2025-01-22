import 'dart:convert';

import 'package:http/http.dart' as http;

class getAllCategoriesService {
  String baseUrl = 'https://fakestoreapi.com/products/';

  Future<List<dynamic>> getCategories() async {
    http.Response response = await http.get(Uri.parse('${baseUrl}categories'));
    if (response.statusCode == 200) {
      List<String> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          "there is a peoblem in status code ${response.statusCode}");
    }
  }
}
