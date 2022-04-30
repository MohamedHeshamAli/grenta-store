import 'package:flutter/material.dart';
import 'package:grenta_store/widgets/my%20button.dart';
import 'package:grenta_store/widgets/my%20drag%20down%20button.dart';
import 'package:grenta_store/widgets/my%20text%20Form%20field.dart';

// ignore: must_be_immutable
class RegistrationScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phone1Controller = TextEditingController();
  TextEditingController phone2Controller = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController distractController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  RegistrationScreen({Key? key}) : super(key: key);
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
                  controller: nameController,
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
                  controller: emailController,
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
                  controller: phone1Controller,
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
                  controller: phone2Controller,
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
                  controller: addressController,
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
                  controller: distractController,
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
                  controller: password1Controller,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  icon: Icons.lock,
                  validator: (s) {
                    if (s == null || s.isEmpty) {
                      return "يجب ادخال كلمة المرور";
                    } else if (password1Controller.text !=
                        password2Controller.text) {
                      return "يجب ان تكةن كلمتي المرور متطابقتين";
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  label: "كلمة المرور",
                  controller: password2Controller,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  icon: Icons.lock,
                  validator: (s) {
                    if (s == null || s.isEmpty) {
                      return "يجب ادخال كلمة المرور";
                    } else if (password1Controller.text !=
                        password2Controller.text) {
                      return "يجب ان تكةن كلمتي المرور متطابقتين";
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              MyButton(
                label: "إنشاء",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    //ToDo send online api
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
