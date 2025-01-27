class productModel {
  final int id;
  final String title, description, category, image;
  final String price;
  final ratingModel rating;

  productModel({
    required this.category,
    required this.description,
    required this.id,
    required this.image,
    required this.price,
    required this.title,
    required this.rating,
  });

  factory productModel.fromJson(jsonData) {
    return productModel(
      category: jsonData["category"],
      description: jsonData["description"],
      id: jsonData["id"],
      image: jsonData["image"],
      price: (jsonData["price"].toString()),
      title: jsonData["title"],
      rating: jsonData["rating"] != null
          ? ratingModel.fromJson(jsonData["rating"])
          : ratingModel(rate: 0.0, count: 0),
    );
  }
}

class ratingModel {
  final dynamic rate;
  final dynamic count;

  ratingModel({required this.count, required this.rate});

  factory ratingModel.fromJson(jsonData) {
    return ratingModel(
      count: jsonData['count'],
      rate: jsonData["rate"],
    );
  }
}
