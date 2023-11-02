import 'package:hope/utils/util_index.dart';
import 'package:uuid/uuid.dart';


/// 标签
class TagViewModel  {
  /// id
  String id;

  /// 标签名
  String name;

  /// 标签
  TagType type;

  /// 标签
  List? shortcuts;

  TagViewModel(this.id, this.name, this.type);

  factory TagViewModel.create({required String name, required TagType? type}) =>
      TagViewModel(const Uuid().v1(), name, type ?? TagType.shortcut);
}
