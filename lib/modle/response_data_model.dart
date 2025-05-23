class User {
  final int id;
  final String name;
  final String email;
  final int? countryId;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.countryId,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      countryId: map['country_id'],
    );
  }
}
