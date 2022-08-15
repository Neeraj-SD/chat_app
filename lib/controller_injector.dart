import 'package:chat_app/Auth/repository/auth_repository.dart';
import 'package:chat_app/Chat/controllers/chat_controller.dart';
import 'package:chat_app/Chat/controllers/chat_overview_controller.dart';
import 'package:chat_app/Chat/controllers/redis_controller.dart';
import 'package:chat_app/core/Database/database.dart';
import 'package:chat_app/core/Redis/redis_service.dart';
import 'package:chat_app/core/SecureStorage/secure_storage.dart';
import 'package:get/get.dart';

import 'Auth/controllers/auth_controller.dart';
import 'Chat/repository/chat_repository.dart';

class ControllerInjector {
  Future<void> init() async {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => RedisController());
    Get.lazyPut(() => ChatController(), fenix: true);
    Get.lazyPut(() => ChatOverviewController());

    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(() => ChatRepository());

    Get.lazyPut(() => RedisService());

    Get.lazyPut(() => SecureStorage());
    Get.lazyPut(() => MyDatabase());
  }
}
