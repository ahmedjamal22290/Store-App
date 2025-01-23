
import 'package:k/helper/api.dart';
import 'package:k/models/productModel.dart';

class GetAllProducts {
  String baseUrl = "https://fakestoreapi.com/";
  Future<List<productModel>> getProducts() async {
    List<dynamic> data = await Api().get('${baseUrl}products');

    List<productModel> ListOfProducts = [];
    for (int i = 0; i < data.length; i++) {
      ListOfProducts.add(productModel.fromJson(data[i]));
    }
    return ListOfProducts;
  }
}
