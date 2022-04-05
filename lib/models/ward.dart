class Ward {
  Ward({
    int? id,
    int? wardNo,
    String? wardCouncillor,
    String? wardSecretary,
  }) {
    _id = id;
    _wardNo = wardNo;
    _wardCouncillor = wardCouncillor;
    _wardSecretary = wardSecretary;
  }

  Ward.fromJson(dynamic json) {
    _id = json['id'];
    _wardNo = json['ward_no'];
    _wardCouncillor = json['ward_councillor'];
    _wardSecretary = json['ward_secretary'];
  }
  static final columns = ["id", "ward_no", "ward_councillor", "ward_secretary"];

  int? _id;
  int? _wardNo;
  String? _wardCouncillor;
  String? _wardSecretary;

  int? get id => _id;

  int? get wardNo => _wardNo;

  String? get wardCouncillor => _wardCouncillor;

  String? get wardSecretary => _wardSecretary;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['ward_no'] = _wardNo;
    map['ward_councillor'] = _wardCouncillor;
    map['ward_secretary'] = _wardSecretary;
    return map;
  }
}
