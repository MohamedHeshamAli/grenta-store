import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/common.dart';
import 'package:grenta_store/controllers/internet%20controller.dart';
import 'package:grenta_store/controllers/login%20controrller.dart';
import 'package:grenta_store/views/home/home%20screen.dart';
import 'package:grenta_store/views/login/registration%20screen.dart';
import 'package:grenta_store/widgets/CircularIndicator.dart';
import 'package:grenta_store/widgets/alert/alert%20message.dart';
import 'package:grenta_store/widgets/my%20button.dart';
import 'package:grenta_store/widgets/my%20text%20Form%20field.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final LoginController _controller = Get.put(LoginController());
  final InternetController _internetController = Get.put(InternetController());
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 140,
              child: Image.asset(
                "images/logo.jpg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height - 180,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextField(
                        label: "البريد الالكتروني ",
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        icon: Icons.email,
                        validator: (s) {
                          if (s == null || s.isEmpty) {
                            return "يجب ادخال الايميل";
                          }
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                        label: "كلمة المرور",
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                        icon: Icons.lock,
                        validator: (s) {
                          if (s == null || s.isEmpty) {
                            return "يجب ادخال كلمة المرور";
                          }
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    GetX<LoginController>(builder: (_) {
                      return _controller.loginLoading.value
                          ? const CircularIndicator()
                          : MyButton(
                              label: "تسجيل الدخول",
                              onPressed: () async {
                                //TODO check from api
                                if (formKey.currentState!.validate()) {
                                  await _controller.login(
                                      email: emailController.text,
                                      password: passwordController.text);
                                  if (_internetController
                                      .internetCurrentStatus) {
                                    if (_controller.loginError.value) {
                                      alertMessage(context,
                                          "الايميل او كلمه المرور خطأ برجاء المحاوله مرة اخرى");
                                    } else {
                                      Get.off(HomeScreen());
                                    }
                                  } else {
                                    alertMessage(context,
                                        "لا يوجد انتر نت برجاء المحاوله مرة اخرى");
                                  }
                                }
                              },
                            );
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(RegistrationScreen());
                        },
                        child: Text(
                          "إنشاء حساب ",
                          style: textTitleStyle.copyWith(color: appBarColor),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
