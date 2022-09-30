import 'package:drift/drift.dart';
import 'package:fairyland_shortcuts/models/database/database.dart';

part 'shortcut_repository.g.dart';

@DriftAccessor(tables: [ShortcutTable])
class ShortcutRepository extends DatabaseAccessor<Database> with _$ShortcutRepositoryMixin{
  ShortcutRepository(Database db) : super(db);
}
