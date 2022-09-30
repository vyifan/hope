part of '../database.dart';

@DataClassName('App')
class AppTable extends BaseEntity {
  TextColumn get name => text().unique()();

  TextColumn get icon => text()();
}
