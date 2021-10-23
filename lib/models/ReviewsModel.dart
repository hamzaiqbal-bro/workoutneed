class ReviewsModel {
  ReviewsModel({
    required this.userName,
    required this.userImageUrl,
    required this.rating,
    required this.reviewText,
    required this.date
  });

  String userName;
  String userImageUrl;
  double rating;
  String reviewText;
  String date;

  factory ReviewsModel.fromJson(Map<String, dynamic> json) =>
      ReviewsModel(
        userName: json["user_name"],
        userImageUrl: json["user_image"],
        rating: json["rating"],
        reviewText: json["review_text"],
        date: json["date"]
      );

  Map<String, dynamic> toJson() => {
    "user_name": userName,
    "user_image": userImageUrl,
    "rating": rating,
    "review_text": reviewText,
    "date": date,
  };
}