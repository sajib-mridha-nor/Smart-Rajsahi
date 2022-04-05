class Thana {
  Thana({
      int? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  static final columns = ["id", "name"];

  Thana.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  int? _id;
  String? _name;

  int? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}