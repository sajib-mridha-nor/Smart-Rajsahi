class Moholla {
  Moholla({
      int? id, 
      String? name, 
      int? wardNo,
      String? thana,}){
    _id = id;
    _name = name;
    _wardNo = wardNo;
    _thana = thana;
}

  Moholla.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _wardNo = json['ward_no'] != null ? int.parse(json['ward_no']) : json['ward_no'];
    _thana = json['thana'];
  }

  static final columns = ["id", "name", "ward_no", "thana"];

  int? _id;
  String? _name;
  int? _wardNo;
  String? _thana;

  int? get id => _id;
  String? get name => _name;
  int? get wardNo => _wardNo;
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