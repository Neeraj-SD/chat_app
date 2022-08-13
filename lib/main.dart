import 'package:chat_app/Auth/controllers/auth_controller.dart';
import 'package:chat_app/Auth/views/auth_screen.dart';
import 'package:chat_app/controller_injector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
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
              : const MyHomePage();
        }),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center( 
      child: Text('HomePage'),
    );
  }
}
