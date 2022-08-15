import 'package:chat_app/Chat/controllers/chat_overview_controller.dart';
import 'package:chat_app/core/Database/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Auth/models/user.dart';
import 'chat_screen.dart';

class ChatSearchScreen extends StatelessWidget {
  ChatSearchScreen({Key? key}) : super(key: key);

  final ChatOverviewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.getAllContacts();
    final users = controller.addContacts.value;
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.addContacts.value.isEmpty
              ? const Center(child: CircularProgressIndicator.adaptive())
              : ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                  shrinkWrap: true,
                  itemCount: controller.addContacts.value.length,
                  itemBuilder: (context, index) {
                    ChatRoom user = controller.addContacts.value[index];
                    return Card(
                      child: ListTile(
                        onTap: () async {
                          controller.selectedChat.value = user.id;
                          return Get.to(() => ChatScreen(user: user));
                        },
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(user.picture)),
                        title: Text(user.email),
                      ),
                    );
                  }),
        ),
      ),
    );
  }
}
