
import 'package:k/helper/api.dart';

class getAllCategoriesService {
  String baseUrl = 'https://fakestoreapi.com/products/';

  Future<List<dynamic>> getCategories() async {
    List<String> data = await Api().get('${baseUrl}categories');
    return data;
  }
}
