class productModel {
  final int id;
  final String title, description, category, image;
  final double price;
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
      price: (jsonData["price"] is int)
          ? (jsonData["price"] as int).toDouble()
          : jsonData["price"],
      title: jsonData["title"],
      rating: ratingModel.fromJson(jsonData['rating']),
    );
  }
}

class ratingModel {
  final double rate;
  final int count;

  ratingModel({required this.count, required this.rate});

  factory ratingModel.fromJson(jsonData) {
    return ratingModel(
      count: jsonData['count'],
      rate: (jsonData["rate"] is int)
          ? (jsonData["rate"] as int).toDouble()
          : jsonData["rate"],
    );
  }
}
