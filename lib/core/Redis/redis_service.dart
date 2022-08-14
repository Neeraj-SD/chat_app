import 'package:get/get.dart';
import 'package:redis/redis.dart';

import '../SecureStorage/secure_storage.dart';

class RedisService extends RedisConnection {
  late final RedisConnection conn;
  late final SecureStorage storage;
  late Command cmd;
  late PubSub pubsub;

  bool isConnected = false;

  RedisService() {
    conn = RedisConnection();
    storage = Get.find();
    _connect();
  }

  void _connect() async {
    cmd = await conn.connect(
        'redis-15371.c264.ap-south-1-1.ec2.cloud.redislabs.com', 15371);
    await cmd.send_object(["AUTH", "5B5ANRcBoGPw8QpiMVUNk4MwsQ766q0O"]);
    pubsub = PubSub(cmd);
    final userId = await storage.readUid();
    print('connected to redis... as $userId');
    subscribe([userId]);
  }

  void subscribe(List<String> channels) {
    pubsub.subscribe(channels);
  }

  Stream<dynamic> getStream() => pubsub.getStream();

  Future<void> close() async {
    conn.close();
    return super.close();
  }
}
