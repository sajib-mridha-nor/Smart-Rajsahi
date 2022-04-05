class LoginResponse {
  LoginResponse({
      String? token, 
      String? user, 
      String? expires,}){
    _token = token;
    _user = user;
    _expires = expires;
}

  LoginResponse.fromJson(dynamic json) {
    _token = json['token'];
    _user = json['user'];
    _expires = json['expires'];
  }
  String? _token;
  String? _user;
  String? _expires;

  String? get token => _token;
  String? get user => _user;
  String? get expires => _expires;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['user'] = _user;
    map['expires'] = _expires;
    return map;
  }

}