class BannerResponse {
  BannerResponse({
      int? count, 
      dynamic next, 
      dynamic previous, 
      List<Banner>? results,}){
    _count = count;
    _next = next;
    _previous = previous;
    _results = results;
}

  BannerResponse.fromJson(dynamic json) {
    _count = json['count'];
    _next = json['next'];
    _previous = json['previous'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Banner.fromJson(v));
      });
    }
  }
  int? _count;
  dynamic _next;
  dynamic _previous;
  List<Banner>? _results;

  int? get count => _count;
  dynamic get next => _next;
  dynamic get previous => _previous;
  List<Banner>? get results => _results;

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

class Banner {
  Banner({
      int? id, 
      String? title, 
      String? image, 
      bool? isFeature,}){
    _id = id;
    _title = title;
    _image = image;
    _isFeature = isFeature;
}

  Banner.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _image = json['image'];
    _isFeature = json['is_feature'];
  }
  int? _id;
  String? _title;
  String? _image;
  bool? _isFeature;

  int? get id => _id;
  String? get title => _title;
  String? get image => _image;
  bool? get isFeature => _isFeature;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['image'] = _image;
    map['is_feature'] = _isFeature;
    return map;
  }

}