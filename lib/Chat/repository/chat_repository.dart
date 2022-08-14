// final AuthController controller = Get.find();

import 'dart:convert';
import 'dart:developer';

import 'package:chat_app/Auth/models/user.dart';
import 'package:chat_app/Chat/models/chat.dart';
import 'package:chat_app/core/Database/database.dart';
import 'package:chat_app/core/SecureStorage/secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class ChatRepository {
  final SecureStorage storage;
  final MyDatabase database;
  ChatRepository()
      : storage = Get.find(),
        database = Get.find();

  Future<void> send(String toUserId, String body) async {
    final String url = '$host/api/users/messages/send/$toUserId';

    print('send triggered');

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'x-auth-token': await storage.readToken(),
      },
      body: jsonEncode({'body': body}),
    );

    if (response.statusCode == 201) {
      print(response.body);
      ChatModel chatResponse = chatModelFromJson(response.body);
      Chat chat = Chat.fromJson(chatResponse.toMap());
      final dbResp = await database.insertTask(chat);
      log('dbResp: $dbResp');
    }
  }

  Future<List<User>> getAllContacts() async {
    final String url = '$host/api/users/all';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'x-auth-token': await storage.readToken(),
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      List<User> users = userListFromJson(response.body);
      return users;
    }
    return [];
  }
}
