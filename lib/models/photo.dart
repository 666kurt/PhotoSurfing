class Photo {
  final String id;
  final String altDescription;
  final String url;
  final String username;
  final String name;
  final String profileImage;

  Photo({
    required this.id,
    required this.altDescription,
    required this.url,
    required this.name,
    required this.username,
    required this.profileImage,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json["id"],
      altDescription: json["alt_description"] ?? "",
      url: json["urls"]["raw"],
      name: json["user"]["name"],
      username: json["user"]["username"],
      profileImage: json["user"]["profile_image"]["small"],
    );
  }
}
