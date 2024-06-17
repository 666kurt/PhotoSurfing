class Photo {
  final String id;
  final String altDescription;
  final String rawUrl;
  final String username;
  final String name;

  Photo({
    required this.id,
    required this.altDescription,
    required this.rawUrl,
    required this.name,
    required this.username,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json["id"],
      altDescription: json["alt_description"] ?? "",
      rawUrl: json["urls"]["raw"],
      name: json["user"]["name"],
      username: json["user"]["username"],
    );
  }
}
