import 'dart:developer';
import 'package:chat_app/Auth/models/user.dart';
import 'package:chat_app/core/SecureStorage/secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:google_sign_in/google_sign_in.dart';

import '../../constants.dart';
import '../controllers/auth_controller.dart';

// final AuthController controller = Get.find();

class AuthRepository {
  late final GoogleSignIn googleSignIn;
  final SecureStorage storage = Get.find();
  AuthRepository() {
    googleSignIn = GoogleSignIn();
  }

  Future<AuthState> login(AuthController controller) async {
    try {
      final res = await googleSignIn.signIn();
      GoogleSignInAuthentication googleKey = await res!.authentication;
      log(googleKey.idToken.toString());

      const String url = '$host/api/auth/google';

      final response = await http.post(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'x-auth-google-token': googleKey.idToken.toString(),
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('login successful');
        // Auth auth = authFromJson(response.body);
        User user = userFromJson(response.body);

        storage.save(userToJson(user));

        controller.email.value = user.email;
        controller.uid.value = user.id;
        controller.authToken.value = user.xAuthToken;
        print(user.email);

        // return auth;
      } else {
        print(response.statusCode);
        print(response.body);
        print(response.reasonPhrase);
        return AuthState.NotAuthenticated;
        // throw ServerFailure();
        // throw ServerException();
      }

      return AuthState.Authenticated;
    } on Exception catch (e) {
      log(e.toString());
      return AuthState.NotAuthenticated;
    }
    // log(googleKey.idToken.toString());
  }

  Future<void> signout() async {
    await storage.deleteAll();
    await googleSignIn.signOut();
  }

  Future<AuthState> silentLogin(AuthController controller) async {
    try {
      final String cached = await storage.readToken();
      final String cachedUid = await storage.readUid();
      print('cached $cached');
      if (cached.isEmpty) {
        // print('Reading from cache');
        return AuthState.NotAuthenticated;
      }

      // Global.AUTH_TOKEN = cached.xAuthToken;
      controller.uid.value = cachedUid;

      log('cached UID: $cachedUid');

      return AuthState.Authenticated;
    } catch (ex) {
      print('exception while reading from cache $ex');
      return AuthState.NotAuthenticated;
    }
  }
}
