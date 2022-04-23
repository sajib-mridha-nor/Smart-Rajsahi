class ServiceThana {
  ServiceThana({
      int? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  ServiceThana.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  int? _id;
  String? _name;

  static final columns = ["id", "name"];

  int? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}