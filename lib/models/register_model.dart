class RegisterModel {
  var msg;
  String? userId;

  // RegisterModel({this.msg, this.userId});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    msg = json["msg"];
    userId = json["user_id"];
  }
}
