class MealUserModel {
//  to map to receive the model from firebase

  MealUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    isEmailVerivied = json['isEmailVerivied'];

    // image = json['image'];
    // cover = json['cover'];
    // bio = json['bio'];
  }
  // String? image;
  // String? cover;
  // String? bio;

  MealUserModel({
    this.name,
    this.email,
    this.phone,
    this.uId,
    this.isEmailVerivied,
    // this.image,
    // this.cover,
    // this.bio,
  });
  String? name;
  String? email;
  String? phone;
  String? uId;
  bool? isEmailVerivied;

// to map to send the model to firebase
  Map<String, dynamic> get toMap {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'isEmailVerivied': isEmailVerivied,
      // 'image': image,
      // 'cover': cover,
      // 'bio': bio,
    };
  }
}
