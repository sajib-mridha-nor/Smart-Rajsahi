class ProfileChangeResponse {
  ProfileChangeResponse({
      int? count, 
      dynamic next, 
      dynamic previous, 
      List<ProfileChange>? results,}){
    _count = count;
    _next = next;
    _previous = previous;
    _results = results;
}

  ProfileChangeResponse.fromJson(dynamic json) {
    _count = json['count'];
    _next = json['next'];
    _previous = json['previous'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(ProfileChange.fromJson(v));
      });
    }
  }
  int? _count;
  dynamic _next;
  dynamic _previous;
  List<ProfileChange>? _results;

  int? get count => _count;
  dynamic get next => _next;
  dynamic get previous => _previous;
  List<ProfileChange>? get results => _results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['next'] = _next;
    map['previous'] = _previous;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ProfileChange {
  ProfileChange({
      String? user, 
      String? details, 
      String? profilePicture, 
      String? nidNo, 
      String? nidFont, 
      String? nidBack,}){
    _user = user;
    _details = details;
    _profilePicture = profilePicture;
    _nidNo = nidNo;
    _nidFont = nidFont;
    _nidBack = nidBack;
}

  ProfileChange.fromJson(dynamic json) {
    _user = json['user'];
    _details = json['details'];
    _profilePicture = json['profile_picture'];
    _nidNo = json['nid_no'];
    _nidFont = json['nid_font'];
    _nidBack = json['nid_back'];
  }
  String? _user;
  String? _details;
  String? _profilePicture;
  String? _nidNo;
  String? _nidFont;
  String? _nidBack;

  String? get user => _user;
  String? get details => _details;
  String? get profilePicture => _profilePicture;
  String? get nidNo => _nidNo;
  String? get nidFont => _nidFont;
  String? get nidBack => _nidBack;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user'] = _user;
    map['details'] = _details;
    map['profile_picture'] = _profilePicture;
    map['nid_no'] = _nidNo;
    map['nid_font'] = _nidFont;
    map['nid_back'] = _nidBack;
    return map;
  }

}