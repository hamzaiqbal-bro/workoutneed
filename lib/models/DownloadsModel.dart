class DownloadsModel {
  DownloadsModel({
    required this.text,
    required this.image,
    required this.channelName,
    required this.views,
  });

  String text;
  String image;
  String channelName;
  String views;

  factory DownloadsModel.fromJson(Map<String, dynamic> json) =>
      DownloadsModel(
        text: json["text"],
        image: json["image"],
        channelName: json["channel_name"],
        views: json["views"],
      );

  Map<String, dynamic> toJson() => {
    "text": text,
    "image": image,
    "channel_name": channelName,
    "views": views,
  };
}