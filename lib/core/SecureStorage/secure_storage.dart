import 'dart:developer';

import 'package:chat_app/Auth/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage extends FlutterSecureStorage {
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  late final FlutterSecureStorage storage;

  SecureStorage() : storage = const FlutterSecureStorage();

  Future<void> save(String auth) async => await storage.write(
        key: 'auth',
        value: auth,
        aOptions: _getAndroidOptions(),
      );

  Future<Map<String, String>> readAllValues() async => await storage.readAll(
        aOptions: _getAndroidOptions(),
      );

  Future<String> readUid() async {
    final result = await storage.readAll(aOptions: _getAndroidOptions());
    User auth = userFromJson(result['auth']!);
    return auth.id;
  }

  Future<String> readToken() async {
    final result = await storage.readAll(aOptions: _getAndroidOptions());
    User auth = userFromJson(result['auth']!);
    log(auth.xAuthToken);
    return auth.xAuthToken;
  }
}
