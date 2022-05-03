import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/common.dart';

import 'package:grenta_store/models/customer.dart';

class LoginController extends GetxController {
  RxBool loginLoading = false.obs;
  RxBool loginError = false.obs;
  RxBool registrationLoading = false.obs;
  RxBool registrationError = false.obs;
  String city = "Cairo";
  int cityId = 0;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phone1Controller = TextEditingController();
  TextEditingController phone2Controller = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController distractController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  void changeCity(String newCity) {
    city = newCity;
  }

  Future<void> login({required String email, required String password}) async {
    loginLoading.value = true;
    loginError.value = false;
    try {} catch (e) {
      loginError.value = true;
    }
    loginLoading.value = false;
  }

  void registerAccount() async {
    registrationLoading.value = true;
    registrationError.value = false;
    try {
      Customer newCustomer = Customer(
        name: nameController.text,
        email: emailController.text,
        address: addressController.text,
        city: city,
        distract: distractController.text,
        phone1: phone1Controller.text,
        phone2: phone2Controller.text,
      );
      //ToDo sed data to api
      currentCustomer = newCustomer;
    } catch (e) {
      registrationError.value = true;
    }
    registrationLoading.value = false;
  }
}
