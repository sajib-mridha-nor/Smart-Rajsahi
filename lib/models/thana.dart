class Thana {
  Thana({
      int? id, 
      String? thana, 
      String? thanaBangla,}){
    _id = id;
    _thana = thana;
    _thanaBangla = thanaBangla;
}

  static final columns = ["id", "thana", "thana_bangla"];

  Thana.fromJson(dynamic json) {
    _id = json['id'];
    _thana = json['thana'];
    _thanaBangla = json['thana_bangla'];
  }
  int? _id;
  String? _thana;
  String? _thanaBangla;

  int? get id => _id;
  String? get thana => _thana;
  String? get thanaBangla => _thanaBangla;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['thana'] = _thana;
    map['thana_bangla'] = _thanaBangla;
    return map;
  }

}