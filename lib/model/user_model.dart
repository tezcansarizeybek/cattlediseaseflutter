import 'dart:convert';

class User {
  User({
    this.uuid,
    required this.username,
    this.password,
    this.requestCount = 0,
    this.totalRequest = 0,
    this.picture,
  });

  String? uuid;
  String username;
  String? password;
  int requestCount;
  int totalRequest;
  String? picture;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        uuid: json["uuid"],
        username: json["username"],
        password: json["password"],
        requestCount: json["requestCount"],
        totalRequest: json["totalRequest"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "username": username,
        "password": password,
        "requestCount": requestCount,
        "totalRequest": totalRequest,
        "picture": picture,
      };
}
