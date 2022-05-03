import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/controllers/login%20controrller.dart';
import 'package:grenta_store/views/home/home%20screen.dart';
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
                  label: "الاسم ",
                  controller: _controller.nameController,
                  validator: (s) {
                    if (s == null || s.isEmpty) {
                      return "يجب ادخال الاسم";
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  label: "البريد الالكتروني ",
                  controller: _controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  icon: Icons.email,
                  validator: (s) {
                    if (s == null || s.isEmpty) {
                      return "يجب ادخال الايميل";
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  label: "الهاتف 1  ",
                  controller: _controller.phone1Controller,
                  keyboardType: TextInputType.phone,
                  icon: Icons.phone,
                  validator: (s) {
                    if (s == null || s.isEmpty) {
                      return "يجب ادخال رقم هاتف";
                    } else {
                      try {
                        int phone = int.parse(s);
                      } catch (e) {
                        return "يجب ادخال رقم هاتف صحيح";
                      }
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  label: "الهاتف 2 (اختياري) ",
                  controller: _controller.phone2Controller,
                  keyboardType: TextInputType.phone,
                  icon: Icons.phone,
                  validator: (s) {
                    if (s != null && s.isNotEmpty) {
                      try {
                        int phone = int.parse(s);
                      } catch (e) {
                        return "يجب ادخال رقم هاتف صحيح";
                      }
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  label: "العنوان ",
                  controller: _controller.addressController,
                  icon: Icons.map,
                  validator: (s) {
                    if (s == null || s.isEmpty) {
                      return "يجب ادخال العنوان";
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              MyDropDownButton(
                label: "المدينة ",
                initVal: "القاهرة",
                valuesList: ["القاهرة", "الجيزة"],
                onChange: (val) {},
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  label: "المنطقة ",
                  controller: _controller.distractController,
                  icon: Icons.map,
                  validator: (s) {
                    if (s == null || s.isEmpty) {
                      return "يجب ادخال المنطقة";
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
                              if (isHome) {
                                Get.offAll(HomeScreen());
                              } else {
                                Get.back();
                                Get.back();
                              }
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
