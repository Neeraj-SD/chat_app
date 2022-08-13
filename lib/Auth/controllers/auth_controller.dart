// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: camel_case_types
enum AuthState { Authenticated, NotAuthenticated }

class AuthController extends GetxController {
  late final GoogleSignIn googleSignIn;

  final Rx<AuthState> authState = Rx<AuthState>(AuthState.NotAuthenticated);
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    googleSignIn = GoogleSignIn();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void signIn() async {
    try {
      isLoading.value = true;
      final res = await googleSignIn.signIn();
      GoogleSignInAuthentication googleKey = await res!.authentication;
      authState.value = AuthState.Authenticated;
      log(googleKey.idToken.toString());
    } finally {
      // TODO
      isLoading.value = false;
    }
  }

  void signout() async {
    isLoading.value = true;
    final res = await googleSignIn.signOut();
    isLoading.value = false;
  }
}
