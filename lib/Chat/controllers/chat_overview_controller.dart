import 'dart:developer';

import 'package:chat_app/Auth/models/user.dart';
import 'package:chat_app/core/Database/database.dart';
import 'package:get/get.dart';

import '../repository/chat_repository.dart';

class ChatOverviewController extends GetxController {
  final ChatRepository chatRepository = Get.find();
  final MyDatabase database = Get.find();

  final contacts = RxList<User>.empty(growable: true).obs;
  final selectedChat = ''.obs;

  final chatRooms = RxList<ChatRoomWithMessage>.empty(growable: true).obs;

  final addContacts = RxList<ChatRoom>.empty(growable: true).obs;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();

    // database.watchContacts().listen((event) {
    //   // event.map(((e) => print(e.read())));
    //   log('contacts: $event');
    //   log('contacts-length: ${event.length}');
    // });

    database.watchChatRooms().listen((event) {
      log('chat Rooms: ${event.map((e) => DateTime.parse(e.chat.timeStamp.toString())).toList()}');
      chatRooms.value = RxList(event as List<ChatRoomWithMessage>);
    });

    // chatRepository
    //     .getAllContacts()
    //     .then((value) => contacts.value = RxList(value));
  }

  @override
  void onClose() {}

  void getAllContacts() async => chatRepository
      .getAllContacts()
      .then((value) => addContacts.value = RxList(value));
}
