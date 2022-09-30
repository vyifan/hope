part of '../database.dart';

@DataClassName('Shortcut')
class ShortcutTable extends Table {

  @override
  String get tableName => "shortcut";

  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text().clientDefault(() => const Uuid().v1())();

  TextColumn get name => text()();

  TextColumn get description => text()();

  DateTimeColumn get createTime => dateTime().named('create_time')();

  DateTimeColumn get updateTime => dateTime().nullable().named('update_time')();
}
