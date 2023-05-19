class LimitsModel {
  LimitsModel({
    required this.msg,
    required this.limits,
  });
  late final String msg;
  late final List<Limits> limits;

  LimitsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    limits = List.from(json['limits']).map((e) => Limits.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['limits'] = limits.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Limits {
  Limits({
    required this.id,
    required this.userId,
    required this.label,
    required this.limit,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String id;
  late final String userId;
  late final String label;
  late final int limit;
  late final int value;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  Limits.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userId = json['user_id'];
    label = json['label'];
    limit = json['limit'];
    value = json['value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['user_id'] = userId;
    _data['label'] = label;
    _data['limit'] = limit;
    _data['value'] = value;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}
