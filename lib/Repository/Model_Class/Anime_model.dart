
class AnimeModel {
  List<Data>? data;
  Meta? meta;

  AnimeModel({this.data, this.meta});

  AnimeModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    if(meta != null) {
      _data["meta"] = meta?.toJson();
    }
    return _data;
  }
}

class Meta {
  int? page;
  int? size;
  int? totalData;
  int? totalPage;

  Meta({this.page, this.size, this.totalData, this.totalPage});

  Meta.fromJson(Map<String, dynamic> json) {
    page = json["page"];
    size = json["size"];
    totalData = json["totalData"];
    totalPage = json["totalPage"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["page"] = page;
    _data["size"] = size;
    _data["totalData"] = totalData;
    _data["totalPage"] = totalPage;
    return _data;
  }
}

class Data {
  String? id;
  String? title;
  List<String>? alternativeTitles;
  int? ranking;
  List<String>? genres;
  int? episodes;
  bool? hasEpisode;
  bool? hasRanking;
  String? image;
  String? link;
  String? status;
  String? synopsis;
  String? thumb;
  String? type;

  Data({this.id, this.title, this.alternativeTitles, this.ranking, this.genres, this.episodes, this.hasEpisode, this.hasRanking, this.image, this.link, this.status, this.synopsis, this.thumb, this.type});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    title = json["title"];
    alternativeTitles = json["alternativeTitles"] == null ? null : List<String>.from(json["alternativeTitles"]);
    ranking = json["ranking"];
    genres = json["genres"] == null ? null : List<String>.from(json["genres"]);
    episodes = json["episodes"];
    hasEpisode = json["hasEpisode"];
    hasRanking = json["hasRanking"];
    image = json["image"];
    link = json["link"];
    status = json["status"];
    synopsis = json["synopsis"];
    thumb = json["thumb"];
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["title"] = title;
    if(alternativeTitles != null) {
      _data["alternativeTitles"] = alternativeTitles;
    }
    _data["ranking"] = ranking;
    if(genres != null) {
      _data["genres"] = genres;
    }
    _data["episodes"] = episodes;
    _data["hasEpisode"] = hasEpisode;
    _data["hasRanking"] = hasRanking;
    _data["image"] = image;
    _data["link"] = link;
    _data["status"] = status;
    _data["synopsis"] = synopsis;
    _data["thumb"] = thumb;
    _data["type"] = type;
    return _data;
  }
}