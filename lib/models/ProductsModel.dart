class ProductsModel {
  ProductsModel({
    required this.name,
    required this.imageUrl,
    required this.iconUrl,
    required this.rating,
    required this.price
  });

  String name;
  String imageUrl;
  String iconUrl;
  double rating;
  double price;

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      ProductsModel(
        name: json["name"],
        imageUrl: json["imageUrl"],
        iconUrl: json["iconUrl"],
        rating: json["rating"],
        price: json["price"]
      );

  Map<String, dynamic> toJson() => {
    "name": name,
    "imageUrl": imageUrl,
    "iconUrl": iconUrl,
    "rating": rating,
    "price": price
  };
}