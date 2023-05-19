class LimitsModel {
  String? msg;
  List<Limits>? limits;

  LimitsModel({this.msg, this.limits});

  LimitsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['limits'] != null) {
      limits = <Limits>[];
      json['limits'].forEach((v) {
        limits!.add(new Limits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.limits != null) {
      data['limits'] = this.limits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Limits {
  String? sId;
  String? userId;
  String? label;
  int? limit;
  int? value;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Limits(
      {this.sId,
      this.userId,
      this.label,
      this.limit,
      this.value,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Limits.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    label = json['label'];
    limit = json['limit'];
    value = json['value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['label'] = this.label;
    data['limit'] = this.limit;
    data['value'] = this.value;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
