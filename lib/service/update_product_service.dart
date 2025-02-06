import 'package:k/helper/api.dart';
import 'package:k/models/productModel.dart';

class UpdateProductService {
  Future<productModel> updateProductService(
      {required String id,
      required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
    Map<String, dynamic> response =
        await Api().put(url: "https://fakestoreapi.com/products/$id", body: {
      "title": title,
      "price": price,
      "description": desc,
      "image": image,
      "category": category,
    });
    // Map<String, dynamic> data = jsonDecode(response.body);
    return productModel.fromJson(response);
  }
}
