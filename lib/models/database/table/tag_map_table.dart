part of '../database.dart';

@DataClassName("TagAppMap")
class TagAppMapTable extends Table {
  @override
  String get tableName => "tag_app_map";

  @override
  Set<Column> get primaryKey => {tagId, appId};

  TextColumn get tagId => text().references(TagTable, #id).named('tag_id')();

  TextColumn get appId => text().references(AppTable, #id).named('app_id')();

  DateTimeColumn get createTime => dateTime().named('create_time')();

  DateTimeColumn get updateTime => dateTime().nullable().named('update_time')();
}

@DataClassName("TagShortcutMap")
class TagShortcutMapTable extends Table {
  @override
  String get tableName => "tag_shortcut_map";

  @override
  Set<Column> get primaryKey => {tagId, shortcutId};

  TextColumn get tagId => text().references(TagTable, #id).named('tag_id')();

  TextColumn get shortcutId =>
      text().references(ShortcutTable, #id).named('shortcut_id')();

  DateTimeColumn get createTime => dateTime().named('create_time')();

  DateTimeColumn get updateTime => dateTime().nullable().named('update_time')();
}
