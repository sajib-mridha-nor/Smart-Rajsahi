import 'package:rcc/screens/home/menu/health_form/premises_registration/model/pre_temperament.dart';

class PreTemperamentType {
  PreTemperamentType({
      int? id, 
      PreTemperament? temperament,
      String? type, 
      String? fee,}){
    _id = id;
    _temperament = temperament;
    _type = type;
    _fee = fee;
}

  PreTemperamentType.fromJson(dynamic json) {
    _id = json['id'];
    _temperament = json['temperament'] != null ? PreTemperament.fromJson(json['temperament']) : null;
    _type = json['type'];
    _fee = json['fee'];
  }
  int? _id;
  PreTemperament? _temperament;
  String? _type;
  String? _fee;

  int? get id => _id;
  PreTemperament? get temperament => _temperament;
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