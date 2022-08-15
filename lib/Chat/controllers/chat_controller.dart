// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:chat_app/Auth/controllers/auth_controller.dart';
import 'package:chat_app/Auth/models/user.dart';
import 'package:chat_app/Chat/controllers/chat_overview_controller.dart';
import 'package:chat_app/core/Database/database.dart';
import 'package:get/get.dart';

import '../repository/chat_repository.dart';

class ChatController extends GetxController {
  final ChatRepository chatRepository = Get.find();
  final ChatOverviewController chatOverviewController = Get.find();
  final AuthController authController = Get.find();

  final selectedChat = ''.obs;

  final chats = RxList<Chat>.empty(growable: true).obs;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    MyDatabase database = Get.find();
    final String me = authController.uid.value;
    final String selectedChat = chatOverviewController.selectedChat.value;
    log('chatController: Ready ✅ selectedChat: $selectedChat');

    database.watchAllChats(myId: me, userId: selectedChat).listen((event) {
      List<Chat> allChats = event;
      allChats.reversed.toList();
      chats.value = RxList(event.reversed.toList());
    });
  }

  @override
  void onClose() {}

  void sendMessage(String toUserId, String msg) {
    chatRepository.send(toUserId, msg);

    final String me = authController.uid.value;

    Chat chat = Chat(
        id: '${DateTime.now()}',
        from: me,
        to: toUserId,
        status: 'Waiting',
        body: msg,
        timeStamp: DateTime.now(),
        v: 0);

    chats.value.insert(0, chat);

    log('chats from controller: ${chats.value}');
  }
}
