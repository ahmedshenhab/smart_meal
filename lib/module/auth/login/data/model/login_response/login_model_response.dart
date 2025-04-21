class LoginModelResponse {
  factory LoginModelResponse.fromJson(Map<String, dynamic> json) => LoginModelResponse(
    user:
        json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
    token: json['token'] as String?,
  );

  LoginModelResponse({this.user, this.token});
 final User? user;
 final String? token;

  
}

class User {
  factory User.fromJson(Map<String, dynamic> json) => User(
    userName: json['userName'] as String?,
    fullName: json['fullName'] as String?,
    email: json['email'] as String?,
    errorMessages: json['errorMessages'] as List<dynamic>?,
  );

  User({this.userName, this.fullName, this.email, this.errorMessages});
 final  String? userName;
 final String? fullName;
  String? email;
 final List<dynamic>? errorMessages;

  
}
