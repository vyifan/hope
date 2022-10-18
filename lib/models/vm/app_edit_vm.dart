import 'package:json_annotation/json_annotation.dart';

part 'app_edit_vm.g.dart';

/// 应用
@JsonSerializable()
class AppEditVM {
  /// id
  String? id;

  /// 应用名称
  String? name;

  /// icon
  String? icon;

  /// 显示名称
  String? displayName;

  AppEditVM({this.id, this.name, this.icon, this.displayName});

  factory AppEditVM.fromJson(Map<String,dynamic> json)=>
      _$AppEditVMFromJson(json);

  Map<String,dynamic> toJson()=> _$AppEditVMToJson(this);

}
