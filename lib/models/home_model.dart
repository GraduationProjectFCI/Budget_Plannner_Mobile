class HomeModel {
  HomeModel({
    required this.msg,
    required this.data,
  });
  late final String msg;
  late final HomeData data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = HomeData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['data'] = data.toJson();
    return _data;
  }
}

class HomeData {
  HomeData({
    required this.id,
    required this.userId,
    required this.spent,
    required this.remaining,
    required this.total,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String id;
  late final String userId;
  late final int spent;
  late final int remaining;
  late final int total;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  HomeData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userId = json['user_id'];
    spent = json['spent'];
    remaining = json['remaining'];
    total = json['total'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['user_id'] = userId;
    _data['spent'] = spent;
    _data['remaining'] = remaining;
    _data['total'] = total;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}
