class NoticeResponse {
  NoticeResponse({
      int? count, 
      dynamic next, 
      dynamic previous, 
      List<Notice>? results,}){
    _count = count;
    _next = next;
    _previous = previous;
    _results = results;
}

  NoticeResponse.fromJson(dynamic json) {
    _count = json['count'];
    _next = json['next'];
    _previous = json['previous'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Notice.fromJson(v));
      });
    }
  }
  int? _count;
  dynamic _next;
  dynamic _previous;
  List<Notice>? _results;

  int? get count => _count;
  dynamic get next => _next;
  dynamic get previous => _previous;
  List<Notice>? get results => _results;

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

class Notice {
  Notice({
      int? id, 
      String? title, 
      String? description, 
      dynamic featuredImage, 
      String? featuredFile, 
      String? createdAt, 
      String? url,}){
    _id = id;
    _title = title;
    _description = description;
    _featuredImage = featuredImage;
    _featuredFile = featuredFile;
    _createdAt = createdAt;
    _url = url;
}

  Notice.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _featuredImage = json['featured_image'];
    _featuredFile = json['featured_file'];
    _createdAt = json['created_at'];
    _url = json['url'];
  }
  int? _id;
  String? _title;
  String? _description;
  dynamic _featuredImage;
  String? _featuredFile;
  String? _createdAt;
  String? _url;

  int? get id => _id;
  String? get title => _title;
  String? get description => _description;
  dynamic get featuredImage => _featuredImage;
  String? get featuredFile => _featuredFile;
  String? get createdAt => _createdAt;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['featured_image'] = _featuredImage;
    map['featured_file'] = _featuredFile;
    map['created_at'] = _createdAt;
    map['url'] = _url;
    return map;
  }

}