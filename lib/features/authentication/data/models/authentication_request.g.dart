// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationRequest _$AuthenticationRequestFromJson(
  Map<String, dynamic> json,
) => AuthenticationRequest(
  badgeAlgoKey: json['badgeAlgoKey'] as String?,
  context: json['context'] as String?,
  password: json['password'] as String?,
  applicationIdentifier: json['applicationIdentifier'] as String?,
  login: json['login'] as String?,
  loginDate: json['loginDate'] as String?,
  timestamp: json['timestamp'] as num?,
  token: json['token'] as String?,
  imei: json['imei'] as String?,
  uuid: json['uuid'] as String?,
  degradedToken: json['degradedToken'] as String?,
  snPsm: json['snPsm'] as String?,
  fullDegradedAuth: json['fullDegradedAuth'] as bool?,
);

Map<String, dynamic> _$AuthenticationRequestToJson(
  AuthenticationRequest instance,
) => <String, dynamic>{
  'badgeAlgoKey': instance.badgeAlgoKey,
  'context': instance.context,
  'password': instance.password,
  'applicationIdentifier': instance.applicationIdentifier,
  'login': instance.login,
  'loginDate': instance.loginDate,
  'timestamp': instance.timestamp,
  'token': instance.token,
  'imei': instance.imei,
  'uuid': instance.uuid,
  'degradedToken': instance.degradedToken,
  'snPsm': instance.snPsm,
  'fullDegradedAuth': instance.fullDegradedAuth,
};
