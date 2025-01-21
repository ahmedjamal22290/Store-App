class productModel {
  final int id;
  final String title, description, category, image;
  final double price;
  final ratingModel rating;
  productModel(
      {required this.category,
      required this.description,
      required this.id,
      required this.image,
      required this.price,
      required this.title,
      required this.rating});

  factory productModel.fromJson(jsonData) {
    return productModel(
        category: jsonData["category"],
        description: jsonData["description"],
        id: jsonData["id"],
        image: jsonData["image"],
        price: jsonData["price"],
        title: jsonData["title"],
        rating: ratingModel(
            count: jsonData['rating']['count'],
            rate: jsonData['rating']['rate']));
  }
}

class ratingModel {
  final double rate;
  final int count;
  ratingModel({required this.count, required this.rate});
}
