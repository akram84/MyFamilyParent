class LoginDTO {
  LoginDTO({
    required this.familyName,
    required this.email,
    required this.password,
  });

  final String familyName;
  final String email;
  final String password;

  Map<String, dynamic> toJson() => {
    'familyUserName': familyName,
    'familyEmail': email,
    'familyPassword': password
  };
}
