/// id : 1
/// temperament : "বেসরকারী হাসপাতাল/নার্সিংহোম/ক্লিনিক"

class NatureMedical {
  NatureMedical({
      int? id, 
      String? temperament,}){
    _id = id;
    _temperament = temperament;
}

  NatureMedical.fromJson(dynamic json) {
    _id = json['id'];
    _temperament = json['temperament'];
  }
  int? _id;
  String? _temperament;
NatureMedical copyWith({  int? id,
  String? temperament,
}) => NatureMedical(  id: id ?? _id,
  temperament: temperament ?? _temperament,
);
  int? get id => _id;
  String? get temperament => _temperament;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['temperament'] = _temperament;
    return map;
  }

}