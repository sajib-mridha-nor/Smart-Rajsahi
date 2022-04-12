class Ward {
  Ward({
      int? id, 
      int? wardNo, 
      String? wardNoBangla, 
      int? postOffice,}){
    _id = id;
    _wardNo = wardNo;
    _wardNoBangla = wardNoBangla;
    _postOffice = postOffice;
}

  static final columns = ["id", "ward_no", "ward_no_bangla", "post_office"];

  Ward.fromJson(dynamic json) {
    _id = json['id'];
    _wardNo = json['ward_no'];
    _wardNoBangla = json['ward_no_bangla'];
    _postOffice = json['post_office'];
  }
  int? _id;
  int? _wardNo;
  String? _wardNoBangla;
  int? _postOffice;

  int? get id => _id;
  int? get wardNo => _wardNo;
  String? get wardNoBangla => _wardNoBangla;
  int? get postOffice => _postOffice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['ward_no'] = _wardNo;
    map['ward_no_bangla'] = _wardNoBangla;
    map['post_office'] = _postOffice;
    return map;
  }

}