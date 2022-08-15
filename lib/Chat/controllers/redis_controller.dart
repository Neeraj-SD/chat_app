// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:chat_app/Chat/models/chat.dart';
import 'package:chat_app/Chat/repository/chat_repository.dart';
import 'package:chat_app/core/Database/database.dart';
import 'package:get/get.dart';

import 'package:chat_app/core/Redis/redis_service.dart';

import '../../Auth/models/user.dart';

// ignore: camel_case_types
enum AuthState { Authenticated, NotAuthenticated }

class RedisController extends GetxController {
  final RedisService redisService = Get.find();
  final MyDatabase database = Get.find();

  final ChatRepository chatRepository = Get.find();

  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 2));
    redisService.getStream().listen((event) async {
      if (event[0] == 'message') {
        ChatModel chatResponse = chatModelFromJson(event[2].toString());
        Chat chat = Chat.fromJson(chatResponse.toMap());
        final dbResp = await database.insertChat(chat);

        //! Update or Create Chat Room
        ChatRoom? chatRooom = await database.findChatRoom(chat.from);

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
          log('Chat Room updated: ${chatRoom.name} $respCreate ${chat.timeStamp} ${await database.findChatRoom(chat.from)}');
        } else {
          // Create ChatRoom
          User user = await chatRepository.getContact(chat.from);
          log('user: $user');
          ChatRoom chatRoom = ChatRoom.fromJson({
            'id': user.id,
            'name': user.name,
            'email': user.email,
            'picture': user.picture,
            'lastMessage': chat.id
          });
          final respCreate = await database.insertChatRoom(chatRoom);
          log('Chat Room created: ${chatRoom.name} $respCreate ');
        }

        //!

        log('dbResp: $dbResp');
        log('Redis: $chat}');
      }

      log('Redis: ${event[0]}');
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
