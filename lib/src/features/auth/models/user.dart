class User {
  final String id;
  final String name;
  final String email;
  const User({
    required this.id,
    required this.name,
    required this.email,
  });
  factory User.fromJson(Map<String, dynamic> json) => User(
    id: (json['id'] ?? '').toString(),
    name: (json['provider_name'].trim()),
    email: json['email']?.toString() ?? '',
  );
}
