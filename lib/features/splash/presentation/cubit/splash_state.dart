import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object?> get props => [];
}

class SplashStateInitial extends SplashState {}

class SplashStateLoading extends SplashState {}

class SplashStateSuccess extends SplashState {}

class SplashStateFailure extends SplashState {
  final String error;

  const SplashStateFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
