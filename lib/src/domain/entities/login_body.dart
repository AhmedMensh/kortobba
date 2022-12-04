class LoginBody {
  const LoginBody(this.userName, this.password);

  final String userName, password;

  Map<String, dynamic> toJson() => {
    'username': userName,
    'password': password,
  };
}
