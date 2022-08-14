// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:chat_app/Auth/models/user.dart';
import 'package:chat_app/core/Database/database.dart';
import 'package:get/get.dart';

import '../repository/chat_repository.dart';

class ChatController extends GetxController {
  final ChatRepository chatRepository = Get.find();

  final contacts = RxList<User>.empty(growable: true).obs;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    MyDatabase database = Get.find();
    database.watchAllChats().listen((event) {
      log('fromDb: ${event.length}');
      log('fromDb msg: ${event}');
    });

    chatRepository
        .getAllContacts()
        .then((value) => contacts.value = RxList(value));
  }

  @override
  void onClose() {}

  void sendMessage(String toUserId, String msg) {
    chatRepository.send(toUserId, msg);
    print('sendMessage triggered');
  }
}
