import 'package:chat_app/Auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);
  final AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Obx(
              () => controller.isLoading.value
                  ? CircularProgressIndicator()
                  : Column(
                      children: [
                        ElevatedButton(
                          child: Text('signin'),
                          onPressed: () => controller.signIn(),
                        ),
                        ElevatedButton(
                          child: Text('signout'),
                          onPressed: () => controller.signout(),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
