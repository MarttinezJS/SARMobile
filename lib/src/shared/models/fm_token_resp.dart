// To parse this JSON data, do
//
//     final tokenResp = tokenRespFromJson(jsonString);

class TokenResp {
    bool error;
    String message;
    int status;
    FmToken? body;

    TokenResp({
        required this.error,
        required this.message,
        required this.status,
        required this.body,
    });

    factory TokenResp.fromJson(Map<String, dynamic> json) => TokenResp(
        error: json["error"],
        message: json["message"],
        status: json["status"],
        body: json.containsKey('body') ? FmToken.fromJson(json["body"]): null,
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "status": status,
        "body": body?.toJson(),
    };
}

class FmToken {
    int? id;
    String token;
    String? deviceId;
    DateTime? update;

    FmToken({
        required this.id,
        required this.token,
        required this.deviceId,
        required this.update,
    });

    factory FmToken.fromJson(Map<String, dynamic> json) => FmToken(
        id: json["id"],
        token: json["token"],
        deviceId: json["deviceId"],
        update: DateTime.parse(json["update"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
        "deviceId": deviceId,
        "update": update?.toIso8601String(),
    };
}
