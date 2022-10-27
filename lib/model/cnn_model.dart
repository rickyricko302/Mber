class CnnModel {
  List<Data>? _data;

  CnnModel({List<Data>? data}) {
    if (data != null) {
      this._data = data;
    }
  }

  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;

  CnnModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? _title;
  String? _creator;
  String? _link;
  String? _contentSnippet;
  String? _isoDate;
  Image? _image;

  Data(
      {String? title,
      String? creator,
      String? link,
      String? contentSnippet,
      String? isoDate,
      Image? image}) {
    if (title != null) {
      this._title = title;
    }
    if (creator != null) {
      this._creator = creator;
    }
    if (link != null) {
      this._link = link;
    }
    if (contentSnippet != null) {
      this._contentSnippet = contentSnippet;
    }
    if (isoDate != null) {
      this._isoDate = isoDate;
    }
    if (image != null) {
      this._image = image;
    }
  }

  String? get title => _title;
  set title(String? title) => _title = title;
  String? get creator => _creator;
  set creator(String? creator) => _creator = creator;
  String? get link => _link;
  set link(String? link) => _link = link;
  String? get contentSnippet => _contentSnippet;
  set contentSnippet(String? contentSnippet) =>
      _contentSnippet = contentSnippet;
  String? get isoDate => _isoDate;
  set isoDate(String? isoDate) => _isoDate = isoDate;
  Image? get image => _image;
  set image(Image? image) => _image = image;

  Data.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _creator = json['creator'];
    _link = json['link'];
    _contentSnippet = json['contentSnippet'];
    _isoDate = json['isoDate'];
    _image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this._title;
    data['creator'] = this._creator;
    data['link'] = this._link;
    data['contentSnippet'] = this._contentSnippet;
    data['isoDate'] = this._isoDate;
    if (this._image != null) {
      data['image'] = this._image!.toJson();
    }
    return data;
  }
}

class Image {
  String? _small;
  String? _large;

  Image({String? small, String? large}) {
    if (small != null) {
      this._small = small;
    }
    if (large != null) {
      this._large = large;
    }
  }

  String? get small => _small;
  set small(String? small) => _small = small;
  String? get large => _large;
  set large(String? large) => _large = large;

  Image.fromJson(Map<String, dynamic> json) {
    _small = json['small'];
    _large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this._small;
    data['large'] = this._large;
    return data;
  }
}
