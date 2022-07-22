import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/controllers/profile%20controller.dart';
import 'package:grenta_store/models/customer.dart';

import 'package:grenta_store/widgets/CircularIndicator.dart';
import 'package:grenta_store/widgets/alert/successalert.dart';
import 'package:grenta_store/widgets/my%20button.dart';
import 'package:grenta_store/widgets/my%20text%20Form%20field.dart';
class ChangePasswordScreen extends StatelessWidget {
  final ProfileController _controller = Get.put(ProfileController());
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
   ChangePasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" بيانات الحساب"),
      ),
      body: GetX<ProfileController>(
        builder: (_){
          return _controller.loadingScreen.isTrue?const Center(child:  CircularIndicator()):
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  MyTextField(
                      label: "كلمة المرور القديمة",
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      icon: Icons.lock,
                      validator: (s) {
                        if (s == null || s.isEmpty) {
                          return "يجب ادخال كلمة المرور";
                        } else if (passwordController.text !=Customer.customer!.password) {
                          return "كلمة مرور خاطئة";
                        }
                        return null;
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
                }
                else if(_controller.password1Controller.text.length>6){
                  return "اقل طول لكلمة المرور 6 احرف او ارقام";
                }
                else if (_controller.password1Controller.text !=
                _controller.password2Controller.text) {
                return "يجب ان تكون كلمتي المرور متطابقتين";
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
                } else if(_controller.password2Controller.text.length>6){
                  return "اقل طول لكلمة المرور 6 احرف او ارقام";
                }
                else if (_controller.password1Controller.text !=
                _controller.password2Controller.text) {
                return "يجب ان تكةن كلمتي المرور متطابقتين";
                }
                return null;
                }),
                const SizedBox(
                height: 20,
                ),

                  GetX<ProfileController>(builder: (_) {
                    return _controller.loading.value
                        ? const CircularIndicator()
                        : MyButton(
                      label: "حفظ",
                      onPressed: () async{
                        if (formKey.currentState!.validate()) {
                          //ToDo send online api
                          await _controller.changePassword();
                          SuccessAlert(context, "تم حفظ التعديلات");
                          passwordController.text="";
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
          );
        },
      ),
    );
  }
}
