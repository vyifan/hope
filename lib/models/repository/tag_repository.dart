import 'package:drift/drift.dart';
import 'package:fairyland_shortcuts/models/database/database.dart';
import 'package:fairyland_shortcuts/models/vm/tag_vm.dart';

part 'tag_repository.g.dart';

@DriftAccessor(tables: [TagTable])
class TagRepository extends DatabaseAccessor<Database>
    with _$TagRepositoryMixin {
  TagRepository(Database db) : super(db);

  Future<Tag?> get(String id) async {
    final query = select(tagTable)..where((tag) => tag.id.equals(id));
    return await query.getSingleOrNull();
  }

  Future<String> insert(TagViewModel tag) async {
    // TagTableCompanion.insert(name: tag.name, type: tag.type, createTime: createTime)
    //insert(tag);

    var tagData = TagTableCompanion.insert(
        name: tag.name, type: tag.type, updateTime: Value(DateTime.now()));

    var test = await into(tagTable).insertReturning(tagData,
        onConflict:
            DoUpdate((old) => tagData, target: [tagTable.name, tagTable.type]));

    return '';
  }
}
