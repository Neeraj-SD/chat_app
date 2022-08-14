// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:chat_app/Auth/models/user.dart';
import 'package:chat_app/Auth/repository/auth_repository.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
enum AuthState { Authenticated, NotAuthenticated }

class AuthController extends GetxController {
  late final AuthRepository repository;

  final Rx<AuthState> authState = Rx<AuthState>(AuthState.NotAuthenticated);
  final isLoading = false.obs;

  final email = ''.obs;
  final authToken = ''.obs;
  final uid = ''.obs;

  @override
  void onInit() {
    super.onInit();
    log('auth init called');
    repository = Get.find<AuthRepository>();
  }

  @override
  void onReady() {
    super.onReady();
    log('auth ready called');
    autoLogin();
  }

  @override
  void onClose() {}

  void autoLogin() async {
    isLoading.value = true;
    authState.value = await repository.silentLogin(this);
    isLoading.value = false;
  }

  void signIn() async {
    isLoading.value = true;
    authState.value = await repository.login(this);
    isLoading.value = false;
  }

  void signout() async {
    await repository.signout();
    authState.value = AuthState.NotAuthenticated;
  }
}
