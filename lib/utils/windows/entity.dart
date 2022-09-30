import 'package:json_annotation/json_annotation.dart';

part 'entity.g.dart';

@JsonSerializable()
class InstallApp {
  String? name; // 软件名
  String? displayName; // 显示名称
  String? publisher; // 发布者
  String? installDate; // 安装日期
  String? estimatedSize; // 大小
  String? displayVersion; // 版本String
  String? displayIcon; //icon
  String? installLocation; //安装位置

  InstallApp(
      {this.name,
      this.displayName,
      this.publisher,
      this.installDate,
      this.estimatedSize,
      this.displayVersion,
      this.displayIcon,
      this.installLocation});

  factory InstallApp.fromJson(Map<String, dynamic> json) =>
      _$InstallAppFromJson(json);

  Map<String, dynamic> toJson() => _$InstallAppToJson(this);
}
