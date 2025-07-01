// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) => DeviceModel(
  trigram: json['trigram'] as String,
  serial: json['serial'] as String,
  imei: json['imei'] as String,
  env: json['env'] as String,
  agencyAccount: json['agencyAccount'] as String,
);

Map<String, dynamic> _$DeviceModelToJson(DeviceModel instance) =>
    <String, dynamic>{
      'trigram': instance.trigram,
      'serial': instance.serial,
      'imei': instance.imei,
      'env': instance.env,
      'agencyAccount': instance.agencyAccount,
    };
