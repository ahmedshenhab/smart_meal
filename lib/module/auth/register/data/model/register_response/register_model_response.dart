// // ignore_for_file: public_member_api_docs, sort_constructors_first

// class RegisterModelResponse {
//   final String? userName;
//   final String? fullName;
//   final String? email;

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'userName': userName,
//       'fullName': fullName,

//       'email': email,
//     };
//   }

//   factory RegisterModelResponse.fromMap(Map<String, dynamic> map) {
//     return RegisterModelResponse(
//       userName: map['userName'] != null ? map['userName'] as String : null,
//       fullName: map['fullName'] != null ? map['fullName'] as String : null,
//       email: map['email'] != null ? map['email'] as String : null,
//     );
//   }

//   RegisterModelResponse({
//     required this.userName,
//     required this.fullName,
//     required this.email,
//   });
// }
