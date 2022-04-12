class DevelopmentPhotosResponse {
  DevelopmentPhotosResponse({
      int? count, 
      dynamic next, 
      dynamic previous, 
      List<Photo>? results,}){
    _count = count;
    _next = next;
    _previous = previous;
    _results = results;
}

  DevelopmentPhotosResponse.fromJson(dynamic json) {
    _count = json['count'];
    _next = json['next'];
    _previous = json['previous'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Photo.fromJson(v));
      });
    }
  }
  int? _count;
  dynamic _next;
  dynamic _previous;
  List<Photo>? _results;

  int? get count => _count;
  dynamic get next => _next;
  dynamic get previous => _previous;
  List<Photo>? get results => _results;

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

class Photo {
  Photo({
      int? id, 
      String? title, 
      String? image,}){
    _id = id;
    _title = title;
    _image = image;
}

  Photo.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _image = json['image'];
  }
  int? _id;
  String? _title;
  String? _image;

  int? get id => _id;
  String? get title => _title;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['image'] = _image;
    return map;
  }

}