// ignore_for_file: public_member_api_docs, sort_constructors_first

class LoginErrorModel {
  LoginErrorModel({
     this.message,
     this.status,
     this.code,
  });

  final String? message;
  final bool? status;
  final int? code;

 

  factory LoginErrorModel.fromJson(Map<String, dynamic> map) {
    return LoginErrorModel(
      message: map['message'] != null ? map['message'] as String : null,
      status: map['status'] != null ? map['status'] as bool : null,
      code: map['code'] != null ? map['code'] as int : null,
    );
  }


}
