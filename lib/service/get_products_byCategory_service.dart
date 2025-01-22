import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:k/models/productModel.dart';

class GetProductsBycategoryService {
  String baseUrl = "https://fakestoreapi.com/products/category/";
  Future<List<productModel>> getProductsByCategory(String category) async {
    http.Response response = await http.get(Uri.parse('${baseUrl}${category}'));
    List<dynamic> data = jsonDecode(response.body);
    List<productModel> ListOfProducts = [];
    for (int i = 0; i < data.length; i++) {
      ListOfProducts.add(productModel.fromJson(data[i]));
    }
    return ListOfProducts;
  }
}
