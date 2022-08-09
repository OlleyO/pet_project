class PostModel {
  final String id;
  final String firstName;
  final String lastName;
  final String createdAt;
  final String photoUrl;
  final String authorPhotoUrl;
  final String description;
  final int likes;
  final int comments;

  PostModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.createdAt,
    required this.photoUrl,
    required this.authorPhotoUrl,
    required this.description,
    required this.likes,
    required this.comments,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    final String id = json["id"] as String;
    final int likes = json["likes"] as int;
    final int comments = json["comments"] as int;
    final String firstName = json["first_name"] as String;
    final String lastName = json["last_name"] as String;
    final String createdAt = json["created_at"] as String;
    final String description = json["description"] as String;
    final String photoUrl = json["photo_url"] as String;
    final String authorPhotoUrl = json["author_photo_url"] as String;

    return PostModel(
      id: id,
      firstName: firstName,
      lastName: lastName,
      createdAt: createdAt,
      photoUrl: photoUrl,
      authorPhotoUrl: authorPhotoUrl,
      description: description,
      likes: likes,
      comments: comments,
    );
  }
}
