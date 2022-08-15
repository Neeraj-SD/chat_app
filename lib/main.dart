import 'dart:developer';

import 'package:chat_app/Auth/controllers/auth_controller.dart';
import 'package:chat_app/Auth/views/auth_screen.dart';
import 'package:chat_app/Chat/views/chat_overview_screen.dart';
import 'package:chat_app/controller_injector.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> onBackgroundMessageHandler(RemoteMessage message) async {
  log('fcm Message data:${message.data}');
  log('fcm Message body${message.notification?.body}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getToken();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onBackgroundMessage(onBackgroundMessageHandler);
  // di.sl<Fcm>();

  FirebaseMessaging.onMessage.listen((event) {
    log('On message triggered');
    log(event.notification?.title ?? '');
    log(event.notification?.body ?? '');
  });
  ControllerInjector().init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Obx(() {
          return authController.authState.value == AuthState.NotAuthenticated
              ? AuthScreen()
              : ChatOverviewScreen();
        }),
      ),
    );
  }
}
