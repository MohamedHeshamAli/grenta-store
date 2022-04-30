import 'package:flutter/material.dart';
import 'package:grenta_store/common.dart';
import 'package:grenta_store/widgets/my%20button.dart';
import 'package:grenta_store/widgets/my%20text%20Form%20field.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                  MyButton(
                    label: "تسجيل الدخول",
                    onPressed: () {
                      //TODO go to home Screen
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "إنشاء حساب ",
                        style: textTitleStyle.copyWith(color: appBarColor),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
