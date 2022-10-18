// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstallApp _$InstallAppFromJson(Map<String, dynamic> json) => InstallApp(
      name: json['name'] as String?,
      displayName: json['displayName'] as String?,
      publisher: json['publisher'] as String?,
      installDate: json['installDate'] as String?,
      estimatedSize: json['estimatedSize'] as String?,
      displayVersion: json['displayVersion'] as String?,
      displayIcon: json['displayIcon'] as String?,
      installLocation: json['installLocation'] as String?,
    );

Map<String, dynamic> _$InstallAppToJson(InstallApp instance) =>
    <String, dynamic>{
      'name': instance.name,
      'displayName': instance.displayName,
      'publisher': instance.publisher,
      'installDate': instance.installDate,
      'estimatedSize': instance.estimatedSize,
      'displayVersion': instance.displayVersion,
      'displayIcon': instance.displayIcon,
      'installLocation': instance.installLocation,
    };
