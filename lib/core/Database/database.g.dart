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

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ChatsTable chats = $ChatsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [chats];
}
