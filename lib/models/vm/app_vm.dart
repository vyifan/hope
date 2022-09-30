import 'package:uuid/uuid.dart';
import 'shortcut_vm.dart';
import 'tag_vm.dart';


/// 应用
class AppViewModel   {
  /// id
  String id;

  /// 应用名称
  String name;

  /// icon
  String icon;

  /// 创建时间
  DateTime createTime;

  /// 更新时间
  DateTime? updateTime;

  /// 标签
  List<TagViewModel>? tags;

  /// 快捷键
  List<ShortcutViewModel>? shortcuts;

  AppViewModel(
      {required this.id,
      required this.name,
      required this.icon,
      required this.createTime,
      this.updateTime,
      this.tags,
      this.shortcuts});

  factory AppViewModel.create({
    required String? name,
    required String? icon,
    required List<TagViewModel>? tags,
    required List<ShortcutViewModel>? shortcuts,
  }) =>
      AppViewModel(
          id: const Uuid().v1(),
          name: name ?? '',
          icon: icon ?? '',
          createTime: DateTime.now(),
          tags: tags,
          shortcuts: shortcuts);
}
