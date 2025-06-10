import 'package:json_annotation/json_annotation.dart';
import 'package:myapp/features/authentication/domain/entities/authentication_entity.dart';

part 'authentication_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthenticationModel {
  final int code;
  final String? loginDate;
  final String? token;
  final String? apkUrl;

  AuthenticationModel({
    required this.code,
    this.loginDate,
    this.token,
    this.apkUrl,
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationModelToJson(this);

  // Method to convert the model to a domain entity
  AuthenticationEntity toEntity() {
    // You might want to handle the case where token is null depending on your logic
    return AuthenticationEntity(
      token:
          token ??
          '', // Assuming token is required in entity, provide a default or handle null
    );
  }
}
