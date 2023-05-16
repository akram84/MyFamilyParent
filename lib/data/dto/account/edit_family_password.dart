class EditPasswordDTO{
  EditPasswordDTO({required this.password, required this.passwordConf});

  final String password;
  final String passwordConf;

  Map<String, String> toJson() => {
    'newPassword': password,
    // 'passwordConf': passwordConf,
  };
}