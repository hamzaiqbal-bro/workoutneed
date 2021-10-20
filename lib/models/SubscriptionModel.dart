class SubscriptionModel {
  SubscriptionModel({
    required this.channelName,
    required this.channelIcon
  });

  String channelName;
  String channelIcon;

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionModel(
          channelName: json["channel_name"],
          channelIcon: json["channel_icon"]
      );

  Map<String, dynamic> toJson() => {
    "channel_name": channelName,
    "channel_icon": channelIcon
  };
}