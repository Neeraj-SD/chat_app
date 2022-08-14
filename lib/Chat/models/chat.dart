// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

import 'package:meta/meta.dart';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  ChatModel({
    required this.from,
    required this.to,
    required this.body,
    required this.status,
    required this.id,
    required this.timeStamp,
    required this.v,
  });

  final String from;
  final String to;
  final String body;
  final String status;
  final String id;
  final DateTime timeStamp;
  final int v;

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        from: json["_from"],
        to: json["_to"],
        body: json["body"],
        status: json["status"],
        id: json["_id"],
        timeStamp: DateTime.parse(json["timeStamp"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_from": from,
        "_to": to,
        "body": body,
        "status": status,
        "_id": id,
        "timeStamp": timeStamp.toIso8601String(),
        "__v": v,
      };

  ChatModel copyWith({
    String? from,
    String? to,
    String? body,
    String? status,
    String? id,
    DateTime? timeStamp,
    int? v,
  }) {
    return ChatModel(
      from: from ?? this.from,
      to: to ?? this.to,
      body: body ?? this.body,
      status: status ?? this.status,
      id: id ?? this.id,
      timeStamp: timeStamp ?? this.timeStamp,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'from': from,
      'to': to,
      'body': body,
      'status': status,
      'id': id,
      'timeStamp': timeStamp.millisecondsSinceEpoch,
      'v': v,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      from: map['from'] as String,
      to: map['to'] as String,
      body: map['body'] as String,
      status: map['status'] as String,
      id: map['id'] as String,
      timeStamp: DateTime.fromMillisecondsSinceEpoch(map['timeStamp'] as int),
      v: map['v'] as int,
    );
  }

  @override
  String toString() {
    return 'ChatModel(from: $from, to: $to, body: $body, status: $status, id: $id, timeStamp: $timeStamp, v: $v)';
  }

  @override
  bool operator ==(covariant ChatModel other) {
    if (identical(this, other)) return true;

    return other.from == from &&
        other.to == to &&
        other.body == body &&
        other.status == status &&
        other.id == id &&
        other.timeStamp == timeStamp &&
        other.v == v;
  }

  @override
  int get hashCode {
    return from.hashCode ^
        to.hashCode ^
        body.hashCode ^
        status.hashCode ^
        id.hashCode ^
        timeStamp.hashCode ^
        v.hashCode;
  }
}
