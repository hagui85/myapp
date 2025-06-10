// lib/features/authentication/presentation/cubit/authentication_state.dart
import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  // You might want to include the authenticated user or token here
  // final AuthenticationEntity user;
  // const AuthenticationAuthenticated(this.user);
  // @override
  // List<Object?> get props => [user];
}

class AuthenticationError extends AuthenticationState {
  final String message;
  const AuthenticationError(this.message);

  @override
  List<Object?> get props => [message];
}
