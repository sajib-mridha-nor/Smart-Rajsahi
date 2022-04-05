class ProfileResponse {
  ProfileResponse({
      String? username, 
      String? name, 
      String? nameEnglish, 
      String? mothersName, 
      String? mothersNameEnglish, 
      String? fathersName, 
      String? fathersNameEnglish, 
      String? email, 
      String? address, 
      String? nidNo, 
      String? nid, 
      String? nidBack, 
      String? dateOfBirth, 
      String? profilePicture, 
      bool? isCompletedProfile, 
      bool? isVerified, 
      String? thana, 
      String? moholla, 
      int? citizenWard,}){
    _username = username;
    _name = name;
    _nameEnglish = nameEnglish;
    _mothersName = mothersName;
    _mothersNameEnglish = mothersNameEnglish;
    _fathersName = fathersName;
    _fathersNameEnglish = fathersNameEnglish;
    _email = email;
    _address = address;
    _nidNo = nidNo;
    _nid = nid;
    _nidBack = nidBack;
    _dateOfBirth = dateOfBirth;
    _profilePicture = profilePicture;
    _isCompletedProfile = isCompletedProfile;
    _isVerified = isVerified;
    _thana = thana;
    _moholla = moholla;
    _citizenWard = citizenWard;
}

  ProfileResponse.fromJson(dynamic json) {
    _username = json['username'];
    _name = json['name'];
    _nameEnglish = json['name_english'];
    _mothersName = json['mothers_name'];
    _mothersNameEnglish = json['mothers_name_english'];
    _fathersName = json['fathers_name'];
    _fathersNameEnglish = json['fathers_name_english'];
    _email = json['email'];
    _address = json['address'];
    _nidNo = json['nid_no'];
    _nid = json['nid'];
    _nidBack = json['nid_back'];
    _dateOfBirth = json['date_of_birth'];
    _profilePicture = json['profile_picture'];
    _isCompletedProfile = json['is_completed_profile'];
    _isVerified = json['is_verified'];
    _thana = json['thana'];
    _moholla = json['moholla'];
    _citizenWard = json['citizen_ward'];
  }
  String? _username;
  String? _name;
  String? _nameEnglish;
  String? _mothersName;
  String? _mothersNameEnglish;
  String? _fathersName;
  String? _fathersNameEnglish;
  String? _email;
  String? _address;
  String? _nidNo;
  String? _nid;
  String? _nidBack;
  String? _dateOfBirth;
  String? _profilePicture;
  bool? _isCompletedProfile;
  bool? _isVerified;
  String? _thana;
  String? _moholla;
  int? _citizenWard;

  String? get username => _username;
  String? get name => _name;
  String? get nameEnglish => _nameEnglish;
  String? get mothersName => _mothersName;
  String? get mothersNameEnglish => _mothersNameEnglish;
  String? get fathersName => _fathersName;
  String? get fathersNameEnglish => _fathersNameEnglish;
  String? get email => _email;
  String? get address => _address;
  String? get nidNo => _nidNo;
  String? get nid => _nid;
  String? get nidBack => _nidBack;
  String? get dateOfBirth => _dateOfBirth;
  String? get profilePicture => _profilePicture;
  bool? get isCompletedProfile => _isCompletedProfile;
  bool? get isVerified => _isVerified;
  String? get thana => _thana;
  String? get moholla => _moholla;
  int? get citizenWard => _citizenWard;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['name'] = _name;
    map['name_english'] = _nameEnglish;
    map['mothers_name'] = _mothersName;
    map['mothers_name_english'] = _mothersNameEnglish;
    map['fathers_name'] = _fathersName;
    map['fathers_name_english'] = _fathersNameEnglish;
    map['email'] = _email;
    map['address'] = _address;
    map['nid_no'] = _nidNo;
    map['nid'] = _nid;
    map['nid_back'] = _nidBack;
    map['date_of_birth'] = _dateOfBirth;
    map['profile_picture'] = _profilePicture;
    map['is_completed_profile'] = _isCompletedProfile;
    map['is_verified'] = _isVerified;
    map['thana'] = _thana;
    map['moholla'] = _moholla;
    map['citizen_ward'] = _citizenWard;
    return map;
  }

}