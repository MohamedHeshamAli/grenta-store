import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grenta_store/controllers/login%20controrller.dart';
import 'package:grenta_store/controllers/profile%20controller.dart';
import 'package:grenta_store/models/customer.dart';
import 'package:grenta_store/views/home/home%20screen/home%20screen.dart';
import 'package:grenta_store/views/login/login%20screen.dart';
import 'package:grenta_store/widgets/CircularIndicator.dart';
import 'package:grenta_store/widgets/alert/successalert.dart';
import 'package:grenta_store/widgets/my%20button.dart';
import 'package:grenta_store/widgets/my%20drag%20down%20button.dart';
import 'package:grenta_store/widgets/my%20text%20Form%20field.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  bool isHome;
  final ProfileController _controller = Get.put(ProfileController());
  var formKey = GlobalKey<FormState>();
  ProfileScreen({Key? key, this.isHome = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" بيانات الحساب"),
      ),
      body: GetX<ProfileController>(
        initState: (_)async{
          if(Customer.customer==null){
            Get.to(LoginScreen(isHome: false,));
          }
          else{
            await _controller.setProfileData();
            //TODO add all like this
            _controller.emailController.text=Customer.customer!.email;
          }
        },
        builder: (_){
          return _controller.loadingScreen.isTrue?const Center(child:  CircularIndicator()):
          SingleChildScrollView(
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
                      icon: Icons.email,isReadOnly: true,
                      validator: (s) {
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
                            if(s.length<10||s.length>13){
                              return "يجب ادخال رقم هاتف صحيح";
                            }
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
                            if(s.length<10||s.length>13){
                              return "يجب ادخال رقم هاتف صحيح";
                            }
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
                    onChange: (val) {
                      _controller.city=val;
                    },
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

                  GetX<ProfileController>(builder: (_) {
                    return _controller.loading.value
                        ? const CircularIndicator()
                        : MyButton(
                      label: "حفظ",
                      onPressed: () async{
                        if (formKey.currentState!.validate()) {
                          //ToDo send online api
                          await _controller.updatingData();
                          SuccessAlert(context, "تم حفظ التعديلات");
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
