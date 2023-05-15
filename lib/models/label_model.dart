class LabelModel {
  String? msg;
  List<LabelData>? data;

  LabelModel({this.msg, this.data});

  LabelModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <LabelData>[];
      json['data'].forEach((v) {
        data!.add(new LabelData.fromJson(v));
      });
    }
  }
}

class LabelData {
  String? LabelId;
  String? userId;
  String? label;
  String? createdAt;
  String? updatedAt;
  int? iV;

  LabelData(
      {this.LabelId,
      this.userId,
      this.label,
      this.createdAt,
      this.updatedAt,
      this.iV});

  LabelData.fromJson(Map<String, dynamic> json) {
    LabelId = json['_id'];
    userId = json['user_id'];
    label = json['label'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
  }
}
