class ProfileModel {
  ProfileModel({
    required this.msg,
    required this.userData,
  });
  late final String msg;
  late final ProfileData userData;

  ProfileModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    userData = ProfileData.fromJson(json['userData']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['userData'] = userData.toJson();
    return _data;
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
  late final String birthdate;
  late final String image;
  late final String accountAge;
  late final bool active;

  ProfileData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    budget = json['budget'];
    currency = json['currency'];
    birthdate = json['birthdate'];
    image = json['image'];
    accountAge = json['account_age'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['gender'] = gender;
    _data['budget'] = budget;
    _data['currency'] = currency;
    _data['birthdate'] = birthdate;
    _data['image'] = image;
    _data['account_age'] = accountAge;
    _data['active'] = active;
    return _data;
  }
}
