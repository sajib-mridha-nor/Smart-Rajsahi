class ServiceMoholla {
  ServiceMoholla({
      int? id, 
      String? name, 
      dynamic wardNo, 
      String? thana,}){
    _id = id;
    _name = name;
    _wardNo = wardNo;
    _thana = thana;
}

  ServiceMoholla.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _wardNo = json['ward_no'];
    _thana = json['thana'];
  }
  int? _id;
  String? _name;
  dynamic _wardNo;
  String? _thana;

  static final columns = ["id", "name", "ward_no", "thana"];

  int? get id => _id;
  String? get name => _name;
  dynamic get wardNo => _wardNo;
  String? get thana => _thana;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['ward_no'] = _wardNo;
    map['thana'] = _thana;
    return map;
  }

}