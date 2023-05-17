class ProfileModel {
  ProfileModel({
    required this.msg,
    required this.userData,
  });

  late final String msg;
  late final ProfileData userData;

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      msg: json['msg'],
      userData: ProfileData.fromJson(json['userData']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'msg': msg,
      'userData': userData.toJson(),
    };
  }
}

class ProfileData {
  ProfileData({
    required this.name,
    required this.email,
    required this.gender,
    required this.budget,
    required this.currency,
    required this.birthdate,
    required this.image,
    required this.accountAge,
    required this.active,
  });

  late final String name;
  late final String email;
  late final String gender;
  late final int budget;
  late final String currency;
  late final String? birthdate;
  late final String image;
  late final String accountAge;
  late final bool active;

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      budget: json['budget'],
      currency: json['currency'],
      birthdate: json['birthdate'],
      image: json['image'],
      accountAge: json['account_age'],
      active: json['active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'gender': gender,
      'budget': budget,
      'currency': currency,
      'birthdate': birthdate,
      'image': image,
      'account_age': accountAge,
      'active': active,
    };
  }
}
