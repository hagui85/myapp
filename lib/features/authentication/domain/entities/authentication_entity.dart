import 'package:equatable/equatable.dart';

class AuthenticationEntity extends Equatable {
  final String token;
  // Add other relevant properties from the authentication response that the domain layer needs

  const AuthenticationEntity({required this.token});

  @override
  List<Object?> get props => [token];
}
