class CartModel {
  CartModel({
    required this.name,
    required this.imageUrl,
    required this.details,
    required this.price,
    required this.item,
    required this.isChecked,
    required this.quantity
  });

  String name;
  String imageUrl;
  String details;
  double price;
  int item;
  bool isChecked;
  int quantity;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      CartModel(
          name: json["name"],
          imageUrl: json["imageUrl"],
          details: json["details"],
          price: json["price"],
          item: json["item"],
          isChecked: json["is_checked"],
          quantity: json["quantity"]
      );

  Map<String, dynamic> toJson() => {
    "name": name,
    "imageUrl": imageUrl,
    "details": details,
    "price": price,
    "item": item,
    "is_checked": isChecked,
    "quantity": quantity
  };
}