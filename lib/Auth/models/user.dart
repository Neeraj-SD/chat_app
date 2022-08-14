// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userListFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userListToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.name,
    required this.picture,
    required this.email,
    required this.xAuthToken,
  });

  final String id;
  final String name;
  final String picture;
  final String email;
  final String xAuthToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        picture: json["picture"],
        email: json["email"],
        xAuthToken: json["x-auth-token"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "picture": picture,
        "email": email,
        "x-auth-token": xAuthToken,
      };
}
