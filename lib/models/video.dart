import 'package:equatable/equatable.dart';

class Video extends Equatable {
  final int id;
  final String url;
  final String? description;

  const Video({required this.id, required this.url, this.description});

  @override
  List<Object?> get props => [id, url, description];
}
