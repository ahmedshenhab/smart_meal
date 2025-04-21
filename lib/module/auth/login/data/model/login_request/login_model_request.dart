class LoginModelRequest {
  LoginModelRequest({required this.email, required this.password});

  final String? email;
  final String? password;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'email': email, 'password': password};
  }
}
