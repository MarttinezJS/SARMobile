
class PushNotification {
  String title;
  String body;

  PushNotification({
    required this.title,
    required this.body,
  });

  factory PushNotification.fromMap(Map<String, dynamic> json) => PushNotification(
    title: json["title"],
    body: json["body"],
  );
}