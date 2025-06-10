// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationModel _$AuthenticationModelFromJson(Map<String, dynamic> json) =>
    AuthenticationModel(
      code: (json['code'] as num).toInt(),
      loginDate: json['loginDate'] as String?,
      token: json['token'] as String?,
      apkUrl: json['apkUrl'] as String?,
    );

Map<String, dynamic> _$AuthenticationModelToJson(
  AuthenticationModel instance,
) => <String, dynamic>{
  'code': instance.code,
  'loginDate': instance.loginDate,
  'token': instance.token,
  'apkUrl': instance.apkUrl,
};
