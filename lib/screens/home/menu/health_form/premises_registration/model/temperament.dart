class Temperament {
  Temperament({
      int? id, 
      String? temperament,}){
    _id = id;
    _temperament = temperament;
}

  Temperament.fromJson(dynamic json) {
    _id = json['id'];
    _temperament = json['temperament'];
  }
  int? _id;
  String? _temperament;

  int? get id => _id;
  String? get temperament => _temperament;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['temperament'] = _temperament;
    return map;
  }

}