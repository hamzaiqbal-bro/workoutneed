class NotificationsModel {
  NotificationsModel({
    required this.text,
    required this.image,
    required this.channelIcon,
    required this.time
  });

  String text;
  String image;
  String channelIcon;
  String time;

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      NotificationsModel(
          text: json["text"],
          image: json["image"],
          channelIcon: json["channel_icon"],
          time: json["time"]
      );

  Map<String, dynamic> toJson() => {
    "text": text,
    "image": image,
    "channel_icon": channelIcon,
    "time": time
  };
}