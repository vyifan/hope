import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

class BaseEntity extends Table {

  @override
  String get tableName => "app";

  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text().clientDefault(() => const Uuid().v1())();

  DateTimeColumn get createTime =>
      dateTime().clientDefault(() => DateTime.now()).named('create_time')();

  DateTimeColumn get updateTime => dateTime().nullable().named('update_time')();
}
