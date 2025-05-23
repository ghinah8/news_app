class NewsSource {
  final int id;
  final String name;
  final String logoUrl;
  bool isFollowing;

  NewsSource({
    required this.id,
    required this.name,
    required this.logoUrl,
    this.isFollowing = false,
  });

  factory NewsSource.fromJson(Map<String, dynamic> json) {
    return NewsSource(
      id: json['id'],
      name: json['name'],
      logoUrl: json['photo'],
      isFollowing: false, // Default value
    );
  }
}
