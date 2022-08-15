// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  User copyWith({
    String? id,
    String? name,
    String? picture,
    String? email,
    String? xAuthToken,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      picture: picture ?? this.picture,
      email: email ?? this.email,
      xAuthToken: xAuthToken ?? this.xAuthToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'picture': picture,
      'email': email,
      'xAuthToken': xAuthToken,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      picture: map['picture'] as String,
      email: map['email'] as String,
      xAuthToken: map['xAuthToken'] as String,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory User.fromJson(String source) =>
  //     User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, picture: $picture, email: $email, xAuthToken: $xAuthToken)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.picture == picture &&
        other.email == email &&
        other.xAuthToken == xAuthToken;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        picture.hashCode ^
        email.hashCode ^
        xAuthToken.hashCode;
  }
}
