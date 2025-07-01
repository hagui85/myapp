class ChewieVideoEntity {
  final int id;
  final String url;
  final String? description;

  const ChewieVideoEntity({
    required this.id,
    required this.url,
    this.description,
  });
}
