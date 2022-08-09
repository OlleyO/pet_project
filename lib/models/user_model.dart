class UserModel {
  final String id;
  final int followers;
  final int following;
  final String firstName;
  final String lastName;
  final String jobTitle;
  final String description;
  final String photoUrl;

  UserModel({
    required this.id,
    required this.followers,
    required this.following,
    required this.firstName,
    required this.lastName,
    required this.jobTitle,
    required this.description,
    required this.photoUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final String id = json["id"] as String;
    final int followers = json["followers"] as int;
    final int following = json["following"] as int;
    final String firstName = json["first_name"] as String;
    final String lastName = json["last_name"] as String;
    final String jobTitle = json["job_title"] as String;
    final String description = json["description"] as String;
    final String photoUrl = json["photo_url"] as String;

    return UserModel(
      id: id,
      followers: followers,
      following: following,
      firstName: firstName,
      lastName: lastName,
      jobTitle: jobTitle,
      description: description,
      photoUrl: photoUrl,
    );
  }
}
