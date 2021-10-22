class CategoryModel {
  CategoryModel({
    required this.categoryName,
    required this.categoryImageUrl
  });

  String categoryName;
  String categoryImageUrl;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      CategoryModel(
          categoryName: json["name"],
          categoryImageUrl: json["imageUrl"]
      );

  Map<String, dynamic> toJson() => {
    "name": categoryName,
    "imageUrl": categoryImageUrl
  };
}