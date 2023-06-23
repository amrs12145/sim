class UserUI {
  String name;
  String email;
  String token;

  UserUI({
    required this.name,
    required this.email,
    required this.token,
  });

  factory UserUI.fromJson(Map<String, dynamic> json) => UserUI(
        name: json['name'],
        email: json['email'],
        token: json['token'],
      );
}
