class ServiceWard {
  ServiceWard({
      int? id, 
      int? wardNo, 
      dynamic wardCouncillor, 
      dynamic wardSecretary,}){
    _id = id;
    _wardNo = wardNo;
    _wardCouncillor = wardCouncillor;
    _wardSecretary = wardSecretary;
}

  ServiceWard.fromJson(dynamic json) {
    _id = json['id'];
    _wardNo = json['ward_no'];
    _wardCouncillor = json['ward_councillor'];
    _wardSecretary = json['ward_secretary'];
  }

  static final columns = ["id", "ward_no", "ward_councillor", "ward_secretary"];

  int? _id;
  int? _wardNo;
  dynamic _wardCouncillor;
  dynamic _wardSecretary;

  int? get id => _id;
  int? get wardNo => _wardNo;
  dynamic get wardCouncillor => _wardCouncillor;
  dynamic get wardSecretary => _wardSecretary;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['ward_no'] = _wardNo;
    map['ward_councillor'] = _wardCouncillor;
    map['ward_secretary'] = _wardSecretary;
    return map;
  }

}