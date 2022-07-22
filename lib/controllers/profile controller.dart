import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/models/customer.dart';
import 'package:http/http.dart';
class ProfileController extends GetxController {
  RxBool loadingScreen = false.obs;
  RxBool loading = false.obs;
  RxBool noClient=false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phone1Controller = TextEditingController();
  TextEditingController phone2Controller = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController distractController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  String city = "";
  int cityId = 0;
  bool isShippingDetail=false;

  void checkingNoClient(){
    if(Customer.customer==null){
      noClient.value=true;
    }
    else{
      noClient.value=false;
    }
  }
  Future setProfileData()async{
    loadingScreen.value=true;
    if(Customer.customer!=null){
      //TODO get client data from api
    }
    loadingScreen.value=false;
  }
  Future updatingData({String? note})async{
   loading.value = true;
   //TODO update client data by api
    Customer(
      password: Customer.customer!.password,
      name: nameController.text,
      email: emailController.text,
      address: addressController.text,
      city: city,
      distract: distractController.text,
      phone: phone1Controller.text,
      additionalPhone: phone2Controller.text,
    );
   loading.value = true;
  }
  Future changePassword()async{
    loading.value = true;
    //TODO update client data by api
    password1Controller.text="";
    password2Controller.text="";
    Customer.customer!.changePassword(password1Controller.text);
    loading.value = false;
  }

}