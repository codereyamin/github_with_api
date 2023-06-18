// user data model

class UserModel {
  UserModel({
    required this.login,
    required this.avatarUrl,
    required this.name,
    required this.location,
    required this.bio,
  });

  final String? login;
  final String? avatarUrl;
  final String? name;
  final String? location;
  final String? bio;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      login: json["login"],
      avatarUrl: json["avatar_url"],
      name: json["name"],
      location: json["location"],
      bio: json["bio"],
    );
  }
}
