import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicknsole_assesment/controller/login_controller.dart';
import 'package:quicknsole_assesment/controller/sign_up_controller.dart'; // Import SignUpController
import 'package:quicknsole_assesment/screens/sign_up_screen.dart';
import 'package:sizer/sizer.dart';

import '../utils/my_colors.dart';
import '../utils/my_textstyle.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());
  final SignUpController signUpController = Get.put(SignUpController());
  bool passwordObsecured = true;
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 11.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome To QuickenSole",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700),),
            ],
          ),
          //SizedBox(height: 3.80.h),
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
                            "Log In",
                            style: TextStyleHelper.h3.copyWith(fontSize: 35, fontWeight: FontWeight.w600, color: MyColors.redColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.h),
                      const Row(
                        children: [
                          Text("Username", style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: CustomTextField(
                          prefixIcon: Icon(Icons.person),
                          controller: loginController.emailController,
                          hintText: "Type Your Username",
                          hintTextColor: Colors.black.withOpacity(0.9),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Username";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Text("Password", style: TextStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: CustomTextField(
                          controller: loginController.passwordController,
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
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Text(
                              "Forgot password ?",
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, "forget_screen");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.sp),
            child: CustomButton(
              onPressed: () {
                if (loginKey.currentState!.validate()) {
                  loginController.SignIn(context);
                }
              },
              label: 'Log In',
            ),
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't Have an Account? ",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
              ),
              SizedBox(width: 2.sp,),
              GestureDetector(
                onTap: () {
                  Get.to(() => SignUpScreen());
                },
                child: Text(
                  "Sign Up",
                  style: TextStyleHelper.h5.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600, color: Colors.red),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
