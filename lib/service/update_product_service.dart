import 'package:http/http.dart' as http;
import 'package:k/helper/api.dart';

class UpdateProductService {
  Future<dynamic> updateProductService(
      {required String id,
      required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
    http.Response response =
        await Api().put(url: "https://fakestoreapi.com/products/$id", body: {
      "title": title,
      "price": price,
      "description": desc,
      "image": image,
      "category": category,
    });
  }
}
