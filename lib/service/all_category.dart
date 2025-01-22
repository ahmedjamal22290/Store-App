import 'dart:convert';

import 'package:http/http.dart' as http;

class getAllCategoriesService {
  String baseUrl = 'https://fakestoreapi.com/products/';

  Future<List<String>> getCategories() async {
    http.Response response = await http.get(Uri.parse('${baseUrl}categories'));
    List<String> result = jsonDecode(response.body);
    return result;
  }
}
