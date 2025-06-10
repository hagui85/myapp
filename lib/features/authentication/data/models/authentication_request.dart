import 'package:json_annotation/json_annotation.dart';
part 'authentication_request.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthenticationRequest {
  final String? badgeAlgoKey;
  final String? context;
  final String? password;
  final String? applicationIdentifier;
  final String? login;
  final String? loginDate;
  final num? timestamp; // Use num to match the example
  final String?
  token; // This might be used in some scenarios as per your example
  final String? imei;
  final String? uuid;
  final String? degradedToken;
  final String? snPsm;
  final bool? fullDegradedAuth;

  AuthenticationRequest({
    this.badgeAlgoKey,
    this.context,
    this.password,
    this.applicationIdentifier,
    this.login,
    this.loginDate,
    this.timestamp,
    this.token,
    this.imei,
    this.uuid,
    this.degradedToken,
    this.snPsm,
    this.fullDegradedAuth,
  });

  factory AuthenticationRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationRequestToJson(this);

  // You might want a method here if you need to convert this to a different object for domain logic,
  // though typically the request model stays in the data layer.
}

// Helper function from your example
Map<String, dynamic> removeEmptyFieldsFromJson(Map<String, dynamic> json) {
  json.removeWhere(
    (key, value) => value == null || (value is String && value.isEmpty),
  );
  return json;
}
