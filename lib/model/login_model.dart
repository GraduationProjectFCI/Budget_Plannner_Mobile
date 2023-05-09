class LoginInfo {
  // late int status;
  var message;
  late String? token;
  late UserData? data;

  LoginInfo.fromjson(Map<String, dynamic> json) {
    // this.status = json['status'];
    this.message = json['msg'];
    this.token = json["token"];
    data = json['user'] == null ? null : UserData.fromjson(json['user']);
  }
}

class UserData {
  late String? id;
  late String? name;

  UserData.fromjson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.id = json['id'];
  }
}
