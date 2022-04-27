class EquipmentType {
  EquipmentType({
      int? id, 
      String? name, 
      String? fee,}){
    _id = id;
    _name = name;
    _fee = fee;
}

  EquipmentType.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _fee = json['fee'];
  }
  int? _id;
  String? _name;
  String? _fee;

  int? get id => _id;
  String? get name => _name;
  String? get fee => _fee;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['fee'] = _fee;
    return map;
  }

}