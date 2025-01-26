import 'dart:developer';

import 'package:k/helper/api.dart';
import 'package:k/models/productModel.dart';

class GetAllProducts {
  String baseUrl = "https://fakestoreapi.com/";
  Future<List<productModel>> getProducts() async {
    log('before await');
    List<dynamic> data = await Api().get('${baseUrl}products');
    log('after await');

    List<productModel> ListOfProducts = [];
    for (int i = 0; i < data.length; i++) {
      log(i.toString());
      ListOfProducts.add(productModel.fromJson(data[i]));
    }

    return ListOfProducts;
  }
}
