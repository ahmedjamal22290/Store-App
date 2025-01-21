import 'dart:convert';

import 'package:k/models/productModel.dart';
import 'package:http/http.dart' as http;

class GetAllProducts {
  String baseUrl = "https://fakestoreapi.com/";
  Future<List<productModel>> getProducts() async {
    http.Response response = await http.get(Uri.parse('${baseUrl}products'));

    List<dynamic> data = jsonDecode(response.body);
    List<productModel> ListOfProducts = [];
    for (int i = 0; i < data.length; i++) {
      ListOfProducts.add(productModel.fromJson(data[i]));
    }
    return ListOfProducts;
  }
}
