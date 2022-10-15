class Notification {
  Notification({
    required this.id,
    required this.message,
    required this.title,
  });

  final int id;
  final String message;
  final String title;

  Notification copyWith({
    int? id,
    String? message,
    String? title,
  }) =>
      Notification(
        id: id ?? this.id,
        message: message ?? this.message,
        title: title ?? this.title,
      );

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"],
        message: json["message"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "title": title,
      };
}
