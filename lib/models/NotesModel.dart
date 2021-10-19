class NotesModel {
  NotesModel({
    required this.label,
    required this.icon,
    required this.date
  });

  String label;
  String icon;
  String date;

  factory NotesModel.fromJson(Map<String, dynamic> json) =>
      NotesModel(
        label: json["label"],
        icon: json["icon"],
        date: json["date"]
      );

  Map<String, dynamic> toJson() => {
    "label": label,
    "icon": icon,
    "date": date
  };
}