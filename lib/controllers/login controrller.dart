import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool loginLoading = false.obs;
  RxBool loginError = false.obs;
  RxBool registrationLoading = false.obs;
  RxBool registrationError = false.obs;
  Future<void> login({required String email, required String password}) async {}
  void registerAccount() async {}
}
