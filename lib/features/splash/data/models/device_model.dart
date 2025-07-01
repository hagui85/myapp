import 'package:json_annotation/json_annotation.dart';

part 'device_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DeviceModel {
  String trigram;
  String serial;
  String imei;
  String env;
  String agencyAccount;

  DeviceModel(
      {required this.trigram,
      required this.serial,
      required this.imei,
      required this.env,
      required this.agencyAccount});

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceModelToJson(this);

  @override
  String toString() {
    return 'DeviceModel{trigram: $trigram, serial: $serial, imei: $imei, env: $env, agencyAccount: $agencyAccount}';
  }
}
