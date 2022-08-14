// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:chat_app/Chat/models/chat.dart';
import 'package:chat_app/core/Database/database.dart';
import 'package:get/get.dart';

import 'package:chat_app/core/Redis/redis_service.dart';

import '../../Auth/models/user.dart';

// ignore: camel_case_types
enum AuthState { Authenticated, NotAuthenticated }

class RedisController extends GetxController {
  final RedisService redisService = Get.find();
  final MyDatabase database = Get.find();

  final chats = RxList<Chat>.empty(growable: true).obs;

  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 2));
    redisService.getStream().listen((event) async {
      if (event[0] == 'message') {
        ChatModel chatResponse = chatModelFromJson(event[2].toString());
        Chat chat = Chat.fromJson(chatResponse.toMap());
        final dbResp = await database.insertTask(chat);
        log('dbResp: $dbResp');
        log('Redis: $chat}');
      }

      log('Redis: ${event[0]}');
    });

    database.watchAllChats().listen((event) {
      List<Chat> allChats = event;
      allChats.reversed.toList();
      chats.value = RxList(event.reversed.toList());
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
