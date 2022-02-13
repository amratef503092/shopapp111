class BannersModel {
  BannersModel({
    required this.status,
    this.message,
    required this.data,
  });
  late final bool status;
  late final Null message;
  late final List<Data> data;

  BannersModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = null;
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.image,
    this.category,
    this.product,
  });
  late final int id;
  late final String image;
  late final Null category;
  late final Null product;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    image = json['image'];
    category = null;
    product = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image'] = image;
    _data['category'] = category;
    _data['product'] = product;
    return _data;
  }
}