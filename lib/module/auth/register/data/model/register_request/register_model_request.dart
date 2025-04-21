// ignore_for_file: public_member_api_docs, sort_constructors_first

class RegisterModelRequest {
  RegisterModelRequest({
    this.confirmPassword,
    this.fullName,
    this.email,
    this.password,
  });

  final String? email;
  final String? password;
  final String? confirmPassword;
  final String? fullName;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'fullName': fullName,
    };
  }
}
