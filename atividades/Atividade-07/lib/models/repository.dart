class Repository {
  final String name;
  final String description;
  final int stars;

  Repository({required this.name, required this.description, required this.stars});

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      stars: json['stargazers_count'] ?? 0,
    );
  }
}
