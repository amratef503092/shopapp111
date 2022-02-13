import 'dart:convert';
/// status : true
/// message : null
/// data : {"current_page":1,"data":[{"id":44,"name":"اجهزه الكترونيه","image":"https://student.valuxapps.com/storage/uploads/categories/16301438353uCFh.29118.jpg"},{"id":43,"name":"مكافحة كورونا","image":"https://student.valuxapps.com/storage/uploads/categories/1630142480dvQxx.3658058.jpg"},{"id":42,"name":"رياضة","image":"https://student.valuxapps.com/storage/uploads/categories/16445270619najK.6242655.jpg"},{"id":40,"name":"ادوات الاناره","image":"https://student.valuxapps.com/storage/uploads/categories/16445230161CiW8.Light bulb-amico.png"},{"id":46,"name":"ملابس","image":"https://student.valuxapps.com/storage/uploads/categories/1644527120pTGA7.clothes.png"}],"first_page_url":"https://student.valuxapps.com/api/categories?page=1","from":1,"last_page":1,"last_page_url":"https://student.valuxapps.com/api/categories?page=1","next_page_url":null,"path":"https://student.valuxapps.com/api/categories","per_page":35,"prev_page_url":null,"to":5,"total":5}

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));
String categoriesToJson(Categories data) => json.encode(data.toJson());
class Categories {
  Categories({
      bool? status, 
      dynamic message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  Categories.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  dynamic _message;
  Data? _data;

  bool? get status => _status;
  dynamic get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// current_page : 1
/// data : [{"id":44,"name":"اجهزه الكترونيه","image":"https://student.valuxapps.com/storage/uploads/categories/16301438353uCFh.29118.jpg"},{"id":43,"name":"مكافحة كورونا","image":"https://student.valuxapps.com/storage/uploads/categories/1630142480dvQxx.3658058.jpg"},{"id":42,"name":"رياضة","image":"https://student.valuxapps.com/storage/uploads/categories/16445270619najK.6242655.jpg"},{"id":40,"name":"ادوات الاناره","image":"https://student.valuxapps.com/storage/uploads/categories/16445230161CiW8.Light bulb-amico.png"},{"id":46,"name":"ملابس","image":"https://student.valuxapps.com/storage/uploads/categories/1644527120pTGA7.clothes.png"}]
/// first_page_url : "https://student.valuxapps.com/api/categories?page=1"
/// from : 1
/// last_page : 1
/// last_page_url : "https://student.valuxapps.com/api/categories?page=1"
/// next_page_url : null
/// path : "https://student.valuxapps.com/api/categories"
/// per_page : 35
/// prev_page_url : null
/// to : 5
/// total : 5

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? currentPage, 
      List<Data2>? data,
      String? firstPageUrl, 
      int? from, 
      int? lastPage, 
      String? lastPageUrl, 
      dynamic nextPageUrl, 
      String? path, 
      int? perPage, 
      dynamic prevPageUrl, 
      int? to, 
      int? total,}){
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
}

  Data.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data2.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }
  int? _currentPage;
  List<Data2>? _data;
  String? _firstPageUrl;
  int? _from;
  int? _lastPage;
  String? _lastPageUrl;
  dynamic _nextPageUrl;
  String? _path;
  int? _perPage;
  dynamic _prevPageUrl;
  int? _to;
  int? _total;

  int? get currentPage => _currentPage;
  List<Data2>? get data => _data;
  String? get firstPageUrl => _firstPageUrl;
  int? get from => _from;
  int? get lastPage => _lastPage;
  String? get lastPageUrl => _lastPageUrl;
  dynamic get nextPageUrl => _nextPageUrl;
  String? get path => _path;
  int? get perPage => _perPage;
  dynamic get prevPageUrl => _prevPageUrl;
  int? get to => _to;
  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }

}

/// id : 44
/// name : "اجهزه الكترونيه"
/// image : "https://student.valuxapps.com/storage/uploads/categories/16301438353uCFh.29118.jpg"


class Data2 {
  Data2({
      int? id, 
      String? name, 
      String? image,}){
    _id = id;
    _name = name;
    _image = image;
}

  Data2.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
  }
  int? _id;
  String? _name;
  String? _image;

  int? get id => _id;
  String? get name => _name;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }

}