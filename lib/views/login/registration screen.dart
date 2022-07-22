import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/controllers/login%20controrller.dart';
import 'package:grenta_store/views/home/home%20screen/home%20screen.dart';
import 'package:grenta_store/widgets/CircularIndicator.dart';
import 'package:grenta_store/widgets/my%20button.dart';
import 'package:grenta_store/widgets/my%20drag%20down%20button.dart';
import 'package:grenta_store/widgets/my%20text%20Form%20field.dart';

// ignore: must_be_immutable
class RegistrationScreen extends StatelessWidget {
  bool isHome;

  final LoginController _controller = Get.find<LoginController>();

  var formKey = GlobalKey<FormState>();

  RegistrationScreen({Key? key, this.isHome = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("إنشاء حساب "),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              MyTextField(
                  label: "البريد الالكتروني ",
                  controller: _controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  icon: Icons.email,
                  validator: (s) {
                    if (s == null || s.isEmpty) {
                      return "يجب ادخال الايميل";
                    }
                    else if( !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(s)){

                      return "يجب ادخال ايميل صحيح";
                    }
                    else{
                      return null;
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  label: "كلمة المرور",
                  controller: _controller.password1Controller,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  icon: Icons.lock,
                  validator: (s) {
                    if (s == null || s.isEmpty) {
                      return "يجب ادخال كلمة المرور";
                    } else if (_controller.password1Controller.text !=
                        _controller.password2Controller.text) {
                      return "يجب ان تكةن كلمتي المرور متطابقتين";
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  label: "كلمة المرور",
                  controller: _controller.password2Controller,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  icon: Icons.lock,
                  validator: (s) {
                    if (s == null || s.isEmpty) {
                      return "يجب ادخال كلمة المرور";
                    } else if (_controller.password1Controller.text !=
                        _controller.password2Controller.text) {
                      return "يجب ان تكةن كلمتي المرور متطابقتين";
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              GetX<LoginController>(builder: (_) {
                return _controller.registrationLoading.value
                    ? const CircularIndicator()
                    : MyButton(
                        label: "إنشاء",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            //ToDo send online api
                            if (_controller.loginError.value == false) {
                              Get.back();
                            }
                            // Navigator.of(context).pushNamedAndRemoveUntil(
                            //     RouteGenerator.main_home,
                            //         (Route<dynamic> route) => false
                            // );
                          }
                        },
                      );
              })
            ],
          ),
        ),
      ),
    );
  }
}
