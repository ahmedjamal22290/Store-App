import 'package:k/helper/api.dart';

import 'package:k/models/productModel.dart';

class GetProductsBycategoryService {
  String baseUrl = "https://fakestoreapi.com/products/category/";
  Future<List<productModel>> getProductsByCategory(String category) async {
    List<dynamic> data = await Api().get('$baseUrl$category');

    List<productModel> ListOfProducts = [];
    for (int i = 0; i < data.length; i++) {
      ListOfProducts.add(productModel.fromJson(data[i]));
    }
    return ListOfProducts;
  }
}
