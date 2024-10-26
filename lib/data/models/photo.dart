class Photo {
  Photo({
    required this.url,
    required this.thumbnailUrl,
    required this.author,
    required this.description,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      url: json['urls']['regular'],
      thumbnailUrl: json['urls']['thumb'],
      author: json['user']['name'],
      description: json['description'] ?? json['alt_description'],
    );
  }

  final String url;
  final String thumbnailUrl;
  final String author;
  final String description;
}
