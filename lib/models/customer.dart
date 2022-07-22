import 'package:get/get.dart';

class Customer {
 static Customer?  customer;
  late String _email,_password;

  String? name, phone, additionalPhone, address, city, distract, id;
  Customer({
    required String email,
    required String password,
    this.id,
    this.name,
    this.address,
    this.city,
    this.distract,
    this.phone,
    this.additionalPhone,
  }){
    _email=email;
    _password=password;
    customer=this;}
void updateData({required String name,address,city,district,phone,
String?additionalPhone,pass}){
  this.name=name;
  this.address=address;
  this.city=city;
  this.distract=distract;
  this.phone=phone;
  this.additionalPhone=additionalPhone;
  pass!=null?this._password=pass:null;
}
void changePassword(String pass){
    _password=pass;
}
String get password=>_password;
String get email=>_email;
}
