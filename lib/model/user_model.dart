import 'dart:convert';

class User {
  User({
    required this.email,
    required this.username,
    required this.password,
    this.rank = 0,
    this.requestCount = 0,
    this.remainingRequest = 0,
    this.picture,
    this.phone = "",
    this.address = "",
  });

  String email;
  String username;
  String password;
  int rank;
  int requestCount;
  int remainingRequest;
  String? picture;
  String phone;
  String address;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        username: json["username"],
        password: json["password"],
        rank: json["rank"],
        requestCount: json["requestCount"],
        remainingRequest: json["remainingRequest"],
        picture: json["picture"],
        phone: json["phone"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "password": password,
        "rank": rank,
        "requestCount": requestCount,
        "remainingRequest": remainingRequest,
        "picture": picture,
        "phone": phone,
        "address": address,
      };
}
