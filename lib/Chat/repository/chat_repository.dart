// final AuthController controller = Get.find();

import 'dart:async';
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
      final dbResp = await database.insertChat(chat);
      log('dbResp: $dbResp');

      //! Update or Create Chat Room
      ChatRoom? chatRooom = await database.findChatRoom(chat.to);

      log('chatRoom: $chatRooom');

      if (chatRooom != null) {
        // Update ChatRoom
        ChatRoom chatRoom = ChatRoom.fromJson({
          'id': chatRooom.id,
          'name': chatRooom.name,
          'email': chatRooom.email,
          'picture': chatRooom.picture,
          'lastMessage': chat.id
        });
        final respCreate = await database.updateChatRoom(chatRoom);
        log('Chat Room updated: ${chatRoom.name} $respCreate');
      } else {
        // Create ChatRoom
        User user = await getContact(chat.to);
        ChatRoom chatRoom = ChatRoom.fromJson({
          'id': user.id,
          'name': user.name,
          'email': user.email,
          'picture': user.picture,
          'lastMessage': chat.id
        });
        final respCreate = await database.insertChatRoom(chatRoom);
        log('Chat Room created: ${chatRoom.name} $respCreate');
      }

      //!
    }
  }

  Future<List<ChatRoom>> getAllContacts() async {
    const String url = '$host/api/users/all';

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
      log(users.map((e) => {...e.toMap(), 'lastMessage': ''}).toString());
      List<ChatRoom> chatRooms = users
          .map((User e) => ChatRoom.fromJson({...e.toMap(), 'lastMessage': ''}))
          .toList();
      return chatRooms;
    }
    return [];
  }

  Future<User> getContact(String userId) async {
    final String url = '$host/api/users/$userId';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'x-auth-token': await storage.readToken(),
      },
    );

    print(response.body);
    User user = userFromJson(response.body);
    return user;

    // return;
  }
}
