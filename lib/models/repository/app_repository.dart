import 'package:drift/drift.dart';
import 'package:hope/models/database/database.dart';

part 'app_repository.g.dart';

@DriftAccessor(tables: [AppTable])
class AppRepository extends DatabaseAccessor<Database> with _$AppRepositoryMixin{
  AppRepository(Database db) : super(db);
}
