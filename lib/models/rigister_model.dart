class RegisterModel {
  RegisterModel({
    required this.status,
    required this.message,
    required this.data,
  });
   late final bool status;
   late final String message;
   late final Data data;

  RegisterModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }


}

class Data {
  Data({
    required this.name,
    required this.email,
    required this.phone,
    required this.id,
    required this.image,
    required this.token,
  });
  late final String name;
  late final String email;
  late final String phone;
  late final int id;
  late final String image;
  late final String token;

  Data.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    id = json['id'];
    image = json['image'];
    token = json['token'];
  }


}