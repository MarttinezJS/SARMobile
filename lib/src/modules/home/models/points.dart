// To parse this JSON data, do
//
//     final response = responseFromJson(jsonString);

import 'dart:convert';

PointResponse responseFromJson(String str) => PointResponse.fromJson(json.decode(str));

class PointResponse {
  bool error;
  String message;
  int status;
  List<MountPoint>? body;

  PointResponse({
    required this.error,
    required this.message,
    required this.status,
    this.body,
  });

  factory PointResponse.fromJson(Map<String, dynamic> json) => PointResponse(
    error: json["error"],
    message: json["message"],
    status: json["status"],
    body: json.containsKey('body')? List<MountPoint>.from(json["body"].map((x) => MountPoint.fromJson(x))): null,
  );

}

class MountPoint {
  int id;
  String url;
  String name;
  bool status;

  MountPoint({
    required this.id,
    required this.url,
    required this.name,
    required this.status,
  });

  factory MountPoint.fromJson(Map<String, dynamic> json) => MountPoint(
    id: json["id"],
    url: json["url"],
    name: json["name"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "name": name,
    "status": status,
  };
}
