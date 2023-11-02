import 'dart:io';

import 'package:drift/drift.dart';
import 'package:hope/models/database/table/base_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;

import 'package:hope/utils/util_index.dart';

part 'table/app_table.dart';
part 'table/shortcut_table.dart';
part 'table/tag_map_table.dart';
part 'table/tag_table.dart';

part 'database.g.dart';

@DriftDatabase(
    tables: [AppTable, ShortcutTable, TagTable, TagAppMapTable, TagShortcutMapTable])
class Database extends _$Database {
  Database() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          /// Enabling [Foreign Key] every open database
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    print(dbFolder);
    return NativeDatabase(file);
  });
}
