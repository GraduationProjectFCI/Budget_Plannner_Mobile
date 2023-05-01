class ResponseModel {
  int? status;
  List<String>? msg;

  ResponseModel({this.status, this.msg});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    return data;
  }
}
