import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quicknsole_assesment/screens/login_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../controller/sign_up_controller.dart';
import '../utils/my_colors.dart';
import '../utils/my_textstyle.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController signUpController = Get.find();
  final RegExp usernameRegex = RegExp(r'^[a-zA-Z]+$');
  final RegExp passwordRegex = RegExp(r'^(?=.*[0-9])(?=.*[!@#$%^&*])(?=.*[A-Z]).{8,}$');

  bool passwordObsecured = true;
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 10.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome To QuickenSole",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),),
            ],
          ),
          // SizedBox(height: 8.80.h,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.80.h, horizontal: 6.w),
            child: Column(
              children: [
                Form(
                  key: loginKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyleHelper.h5.copyWith(fontSize: 30, fontWeight: FontWeight.w600, color: MyColors.redColor),
                          )
                        ],
                      ),
                      SizedBox(height: 3.h),
                      const Row(
                        children: [
                          Text("Name", style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: CustomTextField(
                          prefixIcon: Icon(Icons.person),
                          controller: signUpController.nameController,
                          hintText: "Type Your Name",
                          hintTextColor: Colors.black.withOpacity(0.9),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Name";
                            } else if (!usernameRegex.hasMatch(value)) {
                              return "Username can only contain letters";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 2.h),
                      const Row(
                        children: [
                          Text("Email", style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: CustomTextField(
                          prefixIcon: Icon(Icons.person),
                          controller: signUpController.emailController,
                          hintText: "Type Your Email",
                          hintTextColor: Colors.black.withOpacity(0.9),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Email";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 2.h),
                      const Row(
                        children: [
                          Text("Address", style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: CustomTextField(
                          prefixIcon: Icon(Icons.person),
                          controller: signUpController.addController,
                          hintText: "Type Your Address",
                          hintTextColor: Colors.black.withOpacity(0.9),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Address";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          Text("Password", style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: CustomTextField(
                          controller: signUpController.passwordController,
                          prefixIcon: Icon(Icons.lock_outline_sharp),
                          obscureText: passwordObsecured,
                          hintText: "Type Your Password",
                          hintTextColor: Colors.black.withOpacity(0.9),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                passwordObsecured = !passwordObsecured;
                              });
                            },
                            child: passwordObsecured ? Icon(Icons.visibility_off, color: Colors.black,) : Icon(Icons.remove_red_eye, color: Colors.black,),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Password";
                            } else if (!passwordRegex.hasMatch(value)) {
                              return "Password must be at least 8 characters long";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 1.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 1.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.sp),
            child: CustomButton(
              onPressed: () {
              if (loginKey.currentState!.validate()) {
                signUpController.signUp();
                Get.to(LoginScreen());
              }
            }, label: 'Sign UP',
            ),
          ),
          SizedBox(height: 3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already Have an Account? ",
                style: TextStyleHelper.h5.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600, color: Colors.black),
              ),
              SizedBox(width: 2.sp,),
              GestureDetector(
                onTap: (){
                  Get.to(()=>LoginScreen());
                },
                child: Text(
                  "Sign in",
                  style: TextStyleHelper.h5.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600, color: MyColors.redColor),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
