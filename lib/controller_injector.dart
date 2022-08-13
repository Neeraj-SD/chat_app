import 'package:get/get.dart';

import 'Auth/controllers/auth_controller.dart';

class ControllerInjector {
  Future<void> init() async {
    Get.lazyPut(
      () => AuthController(),
    );
  }
}
