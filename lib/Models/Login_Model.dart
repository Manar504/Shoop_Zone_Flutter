class LoginModel {
 late bool status ;
 late String message;
 late Data data;

 LoginModel.fromjson(
     Map<String , dynamic>json){
    status = json['status'];
    message = json ['message'];
    data = json ['data'];
 }

}

class Data {
  late int id ;
  late String name;
  late String email;
  late String phone;
  late String image;
  late String token;

  Data.fromjsom(
  Map<String , dynamic> json )
  {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];

  }

}