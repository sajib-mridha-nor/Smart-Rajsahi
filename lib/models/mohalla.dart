class Mohalla {
  Mohalla({
      int? id, 
      String? mohalla, 
      String? mohallaBangla, 
      int? ward,}){
    _id = id;
    _mohalla = mohalla;
    _mohallaBangla = mohallaBangla;
    _ward = ward;
}

  static final columns = ["id", "mohalla", "mohalla_bangla", "ward"];

  Mohalla.fromJson(dynamic json) {
    _id = json['id'];
    _mohalla = json['mohalla'];
    _mohallaBangla = json['mohalla_bangla'];
    _ward = json['ward'];
  }
  int? _id;
  String? _mohalla;
  String? _mohallaBangla;
  int? _ward;

  int? get id => _id;
  String? get mohalla => _mohalla;
  String? get mohallaBangla => _mohallaBangla;
  int? get ward => _ward;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['mohalla'] = _mohalla;
    map['mohalla_bangla'] = _mohallaBangla;
    map['ward'] = _ward;
    return map;
  }

}