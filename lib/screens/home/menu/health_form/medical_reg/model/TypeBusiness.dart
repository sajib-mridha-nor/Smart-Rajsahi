/// id : 1
/// temperament : {"id":1,"temperament":"বেসরকারী হাসপাতাল/নার্সিংহোম/ক্লিনিক"}
/// type : "৫ শয্যা থেকে ২০ শয্যা পর্যন্ত"
/// fee : "12000.00"

class TypeBusiness {
  TypeBusiness({
      int? id, 
      Temperament? temperament, 
      String? type, 
      String? fee,}){
    _id = id;
    _temperament = temperament;
    _type = type;
    _fee = fee;
}

  TypeBusiness.fromJson(dynamic json) {
    _id = json['id'];
    _temperament = json['temperament'] != null ? Temperament.fromJson(json['temperament']) : null;
    _type = json['type'];
    _fee = json['fee'];
  }
  int? _id;
  Temperament? _temperament;
  String? _type;
  String? _fee;
TypeBusiness copyWith({  int? id,
  Temperament? temperament,
  String? type,
  String? fee,
}) => TypeBusiness(  id: id ?? _id,
  temperament: temperament ?? _temperament,
  type: type ?? _type,
  fee: fee ?? _fee,
);
  int? get id => _id;
  Temperament? get temperament => _temperament;
  String? get type => _type;
  String? get fee => _fee;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_temperament != null) {
      map['temperament'] = _temperament?.toJson();
    }
    map['type'] = _type;
    map['fee'] = _fee;
    return map;
  }

}

/// id : 1
/// temperament : "বেসরকারী হাসপাতাল/নার্সিংহোম/ক্লিনিক"

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
Temperament copyWith({  int? id,
  String? temperament,
}) => Temperament(  id: id ?? _id,
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