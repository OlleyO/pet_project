class CreatorModel {
  final String id;
  final String photoUrl;

  CreatorModel({
    required this.id,
    required this.photoUrl,
  });

  factory CreatorModel.fromJson(Map<String, dynamic> json) {
    final String id = json["id"] as String;
    final String photoUrl = json["photo_url"] as String;

    return CreatorModel(
      id: id,
      photoUrl: photoUrl,
    );
  }
}
