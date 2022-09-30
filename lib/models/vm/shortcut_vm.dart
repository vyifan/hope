import 'package:uuid/uuid.dart';


/// 快捷键
class ShortcutViewModel  {
  /// id
  String id;

  /// 快捷键
  String key;

  /// 功能描述
  String description;

  ///创建时间
  DateTime createTime;

  ///更新时间
  DateTime? updateTime;

  /// 标签
  List? tags;

  ShortcutViewModel(this.id, this.key, this.description, this.createTime,
      {this.updateTime, this.tags});

  factory ShortcutViewModel.create(
          {required String key,
          required String description,
          required List? tags}) =>
      ShortcutViewModel(const Uuid().v1(), key, description, DateTime.now(), tags: tags);
}
