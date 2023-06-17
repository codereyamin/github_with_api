class UserRepoModel {
  UserRepoModel({
    required this.name,
    required this.htmlUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
  });

  final String? name;
  final String? htmlUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? pushedAt;

  factory UserRepoModel.fromJson(Map<String, dynamic> json) {
    return UserRepoModel(
      name: json["name"],
      htmlUrl: json["html_url"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      pushedAt: DateTime.tryParse(json["pushed_at"] ?? ""),
    );
  }
}
