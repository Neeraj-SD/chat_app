// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:chat_app/Chat/models/chat.dart';

part 'database.g.dart';

// @DataClassName('DChat')
class Chats extends Table {
  TextColumn get id => text().unique().withLength(min: 6, max: 32)();
  TextColumn get from => text().withLength(min: 6, max: 32)();
  TextColumn get to => text().withLength(min: 6, max: 32)();
  TextColumn get status => text().withLength(min: 3, max: 32)();
  TextColumn get body => text().named('body')();
  DateTimeColumn get timeStamp => dateTime()();
  IntColumn get v => integer().withDefault(const Constant(0))();
}

class ChatRooms extends Table {
  TextColumn get id => text().withLength(min: 6, max: 32)();
  TextColumn get name => text().withLength(min: 6, max: 100)();
  TextColumn get email => text().withLength(min: 6, max: 100)();
  TextColumn get picture => text().withLength(min: 6, max: 1000)();
  TextColumn get lastMessage => text().withLength(min: 6, max: 32)();

  @override
  Set<Column> get primaryKey => {id};
}

class ChatRoomWithMessage {
  ChatRoom chatRoom;
  Chat chat;

  ChatRoomWithMessage({
    required this.chatRoom,
    required this.chat,
  });
}

@DriftDatabase(tables: [Chats, ChatRooms])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  // Future<List<Task>> getAllTasks() => select(tasks).get();
  Stream<List<Chat>> watchAllChats(
      {required String myId, required String userId}) {
    return (select(chats)
          ..where((tbl) =>
              (tbl.from.equals(userId) & tbl.to.equals(myId)) |
              (tbl.from.equals(myId) & tbl.to.equals(userId)))
          ..orderBy([
            (t) => OrderingTerm(expression: t.timeStamp, mode: OrderingMode.asc)
          ]))
        .watch();
  }

  Stream<List> watchContacts() {
    final query = selectOnly(chats, distinct: true)..addColumns([chats.from]);
    // return query.watch();

    // final chatQuery = select(chats)..orderBy([(t)=>OrderingTerm.desc(t.timeStamp)])..where((tbl) => tbl.from)

    return query.watch().map((rows) {
      return rows
          .map(
            (row) => row.read(chats.from),
          )
          .toList();
    });
  }

  Stream<List> watchChatRooms() {
    final query = select(chatRooms)
        .join([innerJoin(chats, chats.id.equalsExp(chatRooms.lastMessage))]);

    // final rows = query.map(
    //   (row) => ChatRoomWithMessage(
    //       chatRoom: row.readTable(chatRooms), chat: row.readTable(chats)),
    // );

    query.orderBy([OrderingTerm.desc(chats.timeStamp)]);

    return query.watch().map((rows) {
      return rows
          .map(
            (row) => ChatRoomWithMessage(
                chatRoom: row.readTable(chatRooms), chat: row.readTable(chats)),
          )
          .toList();
    });

    // query.map((p0) => null)
    return query.watch();
  }

  // Future updateOrCreateChatRoom()
  Future findChatRoom(String userId) async {
    return (select(chatRooms)..where((tbl) => tbl.id.equals(userId)))
        .getSingleOrNull();
  }

  Future insertChat(Chat chat) => into(chats).insert(chat);
  Future insertChatRoom(ChatRoom chatRoom) => into(chatRooms).insert(chatRoom);

  Future updateChatRoom(ChatRoom chatRoom) =>
      update(chatRooms).replace(chatRoom);
  // Future deleteTask(Task task) => delete(tasks).delete(task);

}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file, logStatements: true);
  });
}
