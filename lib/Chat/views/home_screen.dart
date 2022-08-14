// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:chat_app/Auth/controllers/auth_controller.dart';
import 'package:chat_app/Chat/controllers/chat_controller.dart';
import 'package:chat_app/Chat/controllers/redis_controller.dart';
import 'package:chat_app/core/Database/database.dart';
import 'package:chat_app/core/Redis/redis_service.dart';

import '../../Auth/models/user.dart';
import '../models/chat.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  final AuthController authController = Get.find();
  final RedisController redisController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => authController.signout(),
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text('Chats'),
              Obx(
                () => Expanded(
                  child: ListView.builder(
                    reverse: true,
                    itemCount: redisController.chats.value.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        ChatBubble(chat: redisController.chats.value[index]),
                  ),
                ),
              ),
              NewMessage(toUserId: user.id),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final AuthController authController = Get.find();

  final Chat chat;
  ChatBubble({
    Key? key,
    required this.chat,
  }) : super(key: key);

  bool isMe(String id) => id == authController.uid.value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isMe(chat.from) ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment:
          isMe(chat.from) ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (!isMe(chat.from))
          CircleAvatar(
            radius: 25,
          ),
        Container(
          margin: EdgeInsets.only(
            top: 18,
            left: 5,
          ),
          // width: MediaQuery.of(context).size.width * 0.7,
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          decoration: BoxDecoration(
            color: isMe(chat.from)
                ? Color.fromRGBO(79, 219, 146, 1)
                : Color.fromRGBO(48, 193, 248, 1),
            borderRadius: BorderRadius.only(
              topLeft:
                  isMe(chat.from) ? Radius.circular(20) : Radius.circular(0),
              topRight:
                  isMe(chat.from) ? Radius.circular(0) : Radius.circular(20),
              bottomRight:
                  isMe(chat.from) ? Radius.circular(30) : Radius.circular(20),
              bottomLeft:
                  isMe(chat.from) ? Radius.circular(20) : Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    '${chat.body}',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
                Text(
                  // '${chat.timeStamp.hour % 12}.${chat.timeStamp.minute}',
                  '${DateFormat.jm().format(chat.timeStamp)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class NewMessage extends StatefulWidget {
  final String toUserId;
  const NewMessage({
    Key? key,
    required this.toUserId,
  }) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final ChatController chatController = Get.find();
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              onChanged: (message) {
                // context
                //     .read<ChatBloc>()
                //     .add(SendMessageChanged(sendMessage: message));
              },
              minLines: 1,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                fillColor: Color.fromRGBO(227, 227, 227, 1),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintText: 'Type Something...',
              ),
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              // gradient: kgradientText,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
                color: Theme.of(context).primaryColor,
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  chatController.sendMessage(
                      widget.toUserId, _controller.value.text.trim());
                  log(_controller.value.text);
                  // chatController.addChat(_controller.value.text.trim());
                  _controller.clear();
                }
                // onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,

                ),
          ),
        ],
      ),
    );
  }
}
