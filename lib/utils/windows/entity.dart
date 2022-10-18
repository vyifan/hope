import 'package:json_annotation/json_annotation.dart';

part 'entity.g.dart';

/// 已安装应用
@JsonSerializable()
class InstallApp {
  /// 软件名
  String? name;

  /// 显示名称
  String? displayName;

  /// 发布者
  String? publisher;

  /// 安装日期
  String? installDate;

  /// 大小
  String? estimatedSize;

  /// 版本String
  String? displayVersion;

  /// icon
  String? displayIcon;

  /// 安装位置
  String? installLocation;

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
