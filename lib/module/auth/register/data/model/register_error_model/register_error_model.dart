class RegisterErrorModel {

  factory RegisterErrorModel.fromMap(Map<String, dynamic> map) {
    return RegisterErrorModel(
      title: map['title'] != null ? map['title'] as String : null,
      status: map['status'] != null ? map['status'] as int : null,
      detail: map['detail'] != null ? map['detail'] as String : null,
    );
  }
  RegisterErrorModel({this.title, this.status, this.detail});

  final String? title;
  final int? status;
  final String? detail;
}
