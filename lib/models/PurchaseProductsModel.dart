class PurchaseProductsModel {
  PurchaseProductsModel({
    required this.name,
    required this.imageUrl,
    required this.details,
    required this.price,
    required this.item,
    required this.quantity
  });

  String name;
  String imageUrl;
  String details;
  double price;
  int item;
  int quantity;

  factory PurchaseProductsModel.fromJson(Map<String, dynamic> json) =>
      PurchaseProductsModel(
          name: json["name"],
          imageUrl: json["imageUrl"],
          details: json["details"],
          price: json["price"],
          item: json["item"],
          quantity: json["quantity"]
      );

  Map<String, dynamic> toJson() => {
    "name": name,
    "imageUrl": imageUrl,
    "details": details,
    "price": price,
    "item": item,
    "quantity": quantity
  };
}