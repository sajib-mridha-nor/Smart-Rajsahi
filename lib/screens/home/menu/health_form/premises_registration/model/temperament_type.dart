import 'package:rcc/screens/home/menu/health_form/premises_registration/model/temperament.dart';

class TemperamentType {
  TemperamentType({
      int? id, 
      Temperament? temperament, 
      String? type, 
      String? fee,}){
    _id = id;
    _temperament = temperament;
    _type = type;
    _fee = fee;
}

  TemperamentType.fromJson(dynamic json) {
    _id = json['id'];
    _temperament = json['temperament'] != null ? Temperament.fromJson(json['temperament']) : null;
    _type = json['type'];
    _fee = json['fee'];
  }
  int? _id;
  Temperament? _temperament;
  String? _type;
  String? _fee;

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