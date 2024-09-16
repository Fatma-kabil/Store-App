class ProductModel {
  int id;
  String title;
  double price;
  String description;
  String image;
  RatingModel? rating;
  String category;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      this.rating,
      required this.category});

  factory ProductModel.fromJson(jsondata) {
    return ProductModel(
      id: jsondata['id'],
      title: jsondata['title'],
      price: double.parse(jsondata['price'].toString()),
      description: jsondata['description'],
      image: jsondata['image'],
      rating: jsondata['rating'] == null
          ? null
          : RatingModel.fromJson(jsondata['rating']),
      category: jsondata['category'],
    );
  }
}

class RatingModel {
  final double rate;
  final int count;
  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsondata) {
    return RatingModel(
        rate: double.parse(jsondata['rate'].toString()),
        count: jsondata['count']);
  }
}
