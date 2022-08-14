import 'package:chat_app/Auth/controllers/auth_controller.dart';
import 'package:chat_app/Auth/models/user.dart';
import 'package:chat_app/Chat/controllers/chat_controller.dart';
import 'package:chat_app/Chat/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controllers/redis_controller.dart';

class ChatOverviewScreen extends StatelessWidget {
  ChatOverviewScreen({Key? key}) : super(key: key);

  final RedisController redisController = Get.find();
  final ChatController chatController = Get.find();
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => authController.signout(),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                  shrinkWrap: true,
                  itemCount: chatController.contacts.value.length,
                  itemBuilder: (context, index) {
                    User user = chatController.contacts.value[index];
                    return Card(
                      child: ListTile(
                        onTap: () => Get.to(() => HomeScreen(user: user)),
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(user.picture)),
                        title: Text(user.email),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
