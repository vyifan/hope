part of '../database.dart';

@DataClassName('Tag')
class TagTable extends BaseEntity {
  @override
  String get tableName => "tag";

  TextColumn get name => text()();

  IntColumn get type => intEnum<TagType>()();

  @override
  List<String> get customConstraints => ['UNIQUE (name, type)'];
}
