import 'package:chat_app/Chat/models/chat.dart';
import 'package:drift/drift.dart';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

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

@DriftDatabase(tables: [Chats])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Future<List<Task>> getAllTasks() => select(tasks).get();
  Stream<List<Chat>> watchAllChats() => select(chats).watch();

  Future insertTask(Chat chat) => into(chats).insert(chat);
  // Future updateTask(Task task) => update(tasks).replace(task);
  // Future deleteTask(Task task) => delete(tasks).delete(task);

}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
