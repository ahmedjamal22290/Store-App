import 'package:k/helper/api.dart';
import 'package:k/models/productModel.dart';

class AddProduct {
  Future<dynamic> addProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
    Map<String, dynamic> data =
        await Api().post(url: 'https://fakestoreapi.com/products', body: {
      "title": title,
      "price": price,
      "description": desc,
      "image": image,
      "category": category,
    });
    return productModel.fromJson(data);
  }
}
