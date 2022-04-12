class FeatureVideosResponse {
  FeatureVideosResponse({
      int? count, 
      dynamic next, 
      dynamic previous, 
      List<Video>? results,}){
    _count = count;
    _next = next;
    _previous = previous;
    _results = results;
}

  FeatureVideosResponse.fromJson(dynamic json) {
    _count = json['count'];
    _next = json['next'];
    _previous = json['previous'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Video.fromJson(v));
      });
    }
  }
  int? _count;
  dynamic _next;
  dynamic _previous;
  List<Video>? _results;

  int? get count => _count;
  dynamic get next => _next;
  dynamic get previous => _previous;
  List<Video>? get results => _results;

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

class Video {
  Video({
      int? id, 
      String? video, 
      bool? isFeatured,}){
    _id = id;
    _video = video;
    _isFeatured = isFeatured;
}

  Video.fromJson(dynamic json) {
    _id = json['id'];
    _video = json['video'];
    _isFeatured = json['is_featured'];
  }
  int? _id;
  String? _video;
  bool? _isFeatured;

  int? get id => _id;
  String? get video => _video;
  bool? get isFeatured => _isFeatured;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['video'] = _video;
    map['is_featured'] = _isFeatured;
    return map;
  }

}