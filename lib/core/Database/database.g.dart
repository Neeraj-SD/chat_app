// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Chat extends DataClass implements Insertable<Chat> {
  final String id;
  final String from;
  final String to;
  final String status;
  final String body;
  final DateTime timeStamp;
  final int v;
  Chat(
      {required this.id,
      required this.from,
      required this.to,
      required this.status,
      required this.body,
      required this.timeStamp,
      required this.v});
  factory Chat.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Chat(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      from: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}from'])!,
      to: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}to'])!,
      status: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status'])!,
      body: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}body'])!,
      timeStamp: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time_stamp'])!,
      v: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}v'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['from'] = Variable<String>(from);
    map['to'] = Variable<String>(to);
    map['status'] = Variable<String>(status);
    map['body'] = Variable<String>(body);
    map['time_stamp'] = Variable<DateTime>(timeStamp);
    map['v'] = Variable<int>(v);
    return map;
  }

  ChatsCompanion toCompanion(bool nullToAbsent) {
    return ChatsCompanion(
      id: Value(id),
      from: Value(from),
      to: Value(to),
      status: Value(status),
      body: Value(body),
      timeStamp: Value(timeStamp),
      v: Value(v),
    );
  }

  factory Chat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Chat(
      id: serializer.fromJson<String>(json['id']),
      from: serializer.fromJson<String>(json['from']),
      to: serializer.fromJson<String>(json['to']),
      status: serializer.fromJson<String>(json['status']),
      body: serializer.fromJson<String>(json['body']),
      timeStamp: serializer.fromJson<DateTime>(json['timeStamp']),
      v: serializer.fromJson<int>(json['v']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'from': serializer.toJson<String>(from),
      'to': serializer.toJson<String>(to),
      'status': serializer.toJson<String>(status),
      'body': serializer.toJson<String>(body),
      'timeStamp': serializer.toJson<DateTime>(timeStamp),
      'v': serializer.toJson<int>(v),
    };
  }

  Chat copyWith(
          {String? id,
          String? from,
          String? to,
          String? status,
          String? body,
          DateTime? timeStamp,
          int? v}) =>
      Chat(
        id: id ?? this.id,
        from: from ?? this.from,
        to: to ?? this.to,
        status: status ?? this.status,
        body: body ?? this.body,
        timeStamp: timeStamp ?? this.timeStamp,
        v: v ?? this.v,
      );
  @override
  String toString() {
    return (StringBuffer('Chat(')
          ..write('id: $id, ')
          ..write('from: $from, ')
          ..write('to: $to, ')
          ..write('status: $status, ')
          ..write('body: $body, ')
          ..write('timeStamp: $timeStamp, ')
          ..write('v: $v')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, from, to, status, body, timeStamp, v);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chat &&
          other.id == this.id &&
          other.from == this.from &&
          other.to == this.to &&
          other.status == this.status &&
          other.body == this.body &&
          other.timeStamp == this.timeStamp &&
          other.v == this.v);
}

class ChatsCompanion extends UpdateCompanion<Chat> {
  final Value<String> id;
  final Value<String> from;
  final Value<String> to;
  final Value<String> status;
  final Value<String> body;
  final Value<DateTime> timeStamp;
  final Value<int> v;
  const ChatsCompanion({
    this.id = const Value.absent(),
    this.from = const Value.absent(),
    this.to = const Value.absent(),
    this.status = const Value.absent(),
    this.body = const Value.absent(),
    this.timeStamp = const Value.absent(),
    this.v = const Value.absent(),
  });
  ChatsCompanion.insert({
    required String id,
    required String from,
    required String to,
    required String status,
    required String body,
    required DateTime timeStamp,
    this.v = const Value.absent(),
  })  : id = Value(id),
        from = Value(from),
        to = Value(to),
        status = Value(status),
        body = Value(body),
        timeStamp = Value(timeStamp);
  static Insertable<Chat> custom({
    Expression<String>? id,
    Expression<String>? from,
    Expression<String>? to,
    Expression<String>? status,
    Expression<String>? body,
    Expression<DateTime>? timeStamp,
    Expression<int>? v,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (from != null) 'from': from,
      if (to != null) 'to': to,
      if (status != null) 'status': status,
      if (body != null) 'body': body,
      if (timeStamp != null) 'time_stamp': timeStamp,
      if (v != null) 'v': v,
    });
  }

  ChatsCompanion copyWith(
      {Value<String>? id,
      Value<String>? from,
      Value<String>? to,
      Value<String>? status,
      Value<String>? body,
      Value<DateTime>? timeStamp,
      Value<int>? v}) {
    return ChatsCompanion(
      id: id ?? this.id,
      from: from ?? this.from,
      to: to ?? this.to,
      status: status ?? this.status,
      body: body ?? this.body,
      timeStamp: timeStamp ?? this.timeStamp,
      v: v ?? this.v,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (from.present) {
      map['from'] = Variable<String>(from.value);
    }
    if (to.present) {
      map['to'] = Variable<String>(to.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (timeStamp.present) {
      map['time_stamp'] = Variable<DateTime>(timeStamp.value);
    }
    if (v.present) {
      map['v'] = Variable<int>(v.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatsCompanion(')
          ..write('id: $id, ')
          ..write('from: $from, ')
          ..write('to: $to, ')
          ..write('status: $status, ')
          ..write('body: $body, ')
          ..write('timeStamp: $timeStamp, ')
          ..write('v: $v')
          ..write(')'))
        .toString();
  }
}

class $ChatsTable extends Chats with TableInfo<$ChatsTable, Chat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'UNIQUE');
  final VerificationMeta _fromMeta = const VerificationMeta('from');
  @override
  late final GeneratedColumn<String?> from = GeneratedColumn<String?>(
      'from', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _toMeta = const VerificationMeta('to');
  @override
  late final GeneratedColumn<String?> to = GeneratedColumn<String?>(
      'to', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String?> status = GeneratedColumn<String?>(
      'status', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 32),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String?> body = GeneratedColumn<String?>(
      'body', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _timeStampMeta = const VerificationMeta('timeStamp');
  @override
  late final GeneratedColumn<DateTime?> timeStamp = GeneratedColumn<DateTime?>(
      'time_stamp', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _vMeta = const VerificationMeta('v');
  @override
  late final GeneratedColumn<int?> v = GeneratedColumn<int?>(
      'v', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, from, to, status, body, timeStamp, v];
  @override
  String get aliasedName => _alias ?? 'chats';
  @override
  String get actualTableName => 'chats';
  @override
  VerificationContext validateIntegrity(Insertable<Chat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('from')) {
      context.handle(
          _fromMeta, from.isAcceptableOrUnknown(data['from']!, _fromMeta));
    } else if (isInserting) {
      context.missing(_fromMeta);
    }
    if (data.containsKey('to')) {
      context.handle(_toMeta, to.isAcceptableOrUnknown(data['to']!, _toMeta));
    } else if (isInserting) {
      context.missing(_toMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('time_stamp')) {
      context.handle(_timeStampMeta,
          timeStamp.isAcceptableOrUnknown(data['time_stamp']!, _timeStampMeta));
    } else if (isInserting) {
      context.missing(_timeStampMeta);
    }
    if (data.containsKey('v')) {
      context.handle(_vMeta, v.isAcceptableOrUnknown(data['v']!, _vMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Chat map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Chat.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ChatsTable createAlias(String alias) {
    return $ChatsTable(attachedDatabase, alias);
  }
}

class ChatRoom extends DataClass implements Insertable<ChatRoom> {
  final String id;
  final String name;
  final String email;
  final String picture;
  final String lastMessage;
  ChatRoom(
      {required this.id,
      required this.name,
      required this.email,
      required this.picture,
      required this.lastMessage});
  factory ChatRoom.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ChatRoom(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      picture: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}picture'])!,
      lastMessage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_message'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['picture'] = Variable<String>(picture);
    map['last_message'] = Variable<String>(lastMessage);
    return map;
  }

  ChatRoomsCompanion toCompanion(bool nullToAbsent) {
    return ChatRoomsCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      picture: Value(picture),
      lastMessage: Value(lastMessage),
    );
  }

  factory ChatRoom.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatRoom(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      picture: serializer.fromJson<String>(json['picture']),
      lastMessage: serializer.fromJson<String>(json['lastMessage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'picture': serializer.toJson<String>(picture),
      'lastMessage': serializer.toJson<String>(lastMessage),
    };
  }

  ChatRoom copyWith(
          {String? id,
          String? name,
          String? email,
          String? picture,
          String? lastMessage}) =>
      ChatRoom(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        picture: picture ?? this.picture,
        lastMessage: lastMessage ?? this.lastMessage,
      );
  @override
  String toString() {
    return (StringBuffer('ChatRoom(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('picture: $picture, ')
          ..write('lastMessage: $lastMessage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, email, picture, lastMessage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatRoom &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.picture == this.picture &&
          other.lastMessage == this.lastMessage);
}

class ChatRoomsCompanion extends UpdateCompanion<ChatRoom> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String> picture;
  final Value<String> lastMessage;
  const ChatRoomsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.picture = const Value.absent(),
    this.lastMessage = const Value.absent(),
  });
  ChatRoomsCompanion.insert({
    required String id,
    required String name,
    required String email,
    required String picture,
    required String lastMessage,
  })  : id = Value(id),
        name = Value(name),
        email = Value(email),
        picture = Value(picture),
        lastMessage = Value(lastMessage);
  static Insertable<ChatRoom> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? picture,
    Expression<String>? lastMessage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (picture != null) 'picture': picture,
      if (lastMessage != null) 'last_message': lastMessage,
    });
  }

  ChatRoomsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? email,
      Value<String>? picture,
      Value<String>? lastMessage}) {
    return ChatRoomsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      picture: picture ?? this.picture,
      lastMessage: lastMessage ?? this.lastMessage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (picture.present) {
      map['picture'] = Variable<String>(picture.value);
    }
    if (lastMessage.present) {
      map['last_message'] = Variable<String>(lastMessage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatRoomsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('picture: $picture, ')
          ..write('lastMessage: $lastMessage')
          ..write(')'))
        .toString();
  }
}

class $ChatRoomsTable extends ChatRooms
    with TableInfo<$ChatRoomsTable, ChatRoom> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatRoomsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _pictureMeta = const VerificationMeta('picture');
  @override
  late final GeneratedColumn<String?> picture = GeneratedColumn<String?>(
      'picture', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 6, maxTextLength: 1000),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _lastMessageMeta =
      const VerificationMeta('lastMessage');
  @override
  late final GeneratedColumn<String?> lastMessage = GeneratedColumn<String?>(
      'last_message', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 6, maxTextLength: 32),
      type: const StringType(),
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, email, picture, lastMessage];
  @override
  String get aliasedName => _alias ?? 'chat_rooms';
  @override
  String get actualTableName => 'chat_rooms';
  @override
  VerificationContext validateIntegrity(Insertable<ChatRoom> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('picture')) {
      context.handle(_pictureMeta,
          picture.isAcceptableOrUnknown(data['picture']!, _pictureMeta));
    } else if (isInserting) {
      context.missing(_pictureMeta);
    }
    if (data.containsKey('last_message')) {
      context.handle(
          _lastMessageMeta,
          lastMessage.isAcceptableOrUnknown(
              data['last_message']!, _lastMessageMeta));
    } else if (isInserting) {
      context.missing(_lastMessageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatRoom map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ChatRoom.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ChatRoomsTable createAlias(String alias) {
    return $ChatRoomsTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ChatsTable chats = $ChatsTable(this);
  late final $ChatRoomsTable chatRooms = $ChatRoomsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [chats, chatRooms];
}
