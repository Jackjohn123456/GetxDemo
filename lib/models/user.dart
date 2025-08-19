class User {
  final String id;
  final String phone;
  final String email;
  final String instaId;
  final String nickName;
  final String portfolio;
  final String workLink;

  User({
    required this.id,
    required this.phone,
    required this.email,
    required this.instaId,
    required this.nickName,
    required this.portfolio,
    required this.workLink,
  });

  /// Converts a JSON map into a User object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      instaId: json['instaId'] ?? '',
      nickName: json['nickName'] ?? '',
      portfolio: json['portfolio'] ?? '',
      workLink: json['workLink'] ?? '',
    );
  }

  /// Converts a User object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'email': email,
      'instaId': instaId,
      'nickName': nickName,
      'portfolio': portfolio,
      'workLink': workLink,
    };
  }
}
